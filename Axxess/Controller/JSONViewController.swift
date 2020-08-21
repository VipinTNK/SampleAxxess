//
//  ViewController.swift
//  Axxess
//
//  Created by iOS TNK on 21/08/20.
//  Copyright © 2020 iOS TNK. All rights reserved.
//

import UIKit
import ObjectMapper

class JSONViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderViewDelegate {

    var recordsModelArray = Array<RecordsModel>()
    var myView = JSONView()
    let tableView = UITableView()
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .white
        myView.frame = CGRect(x: 0, y: 0, width: ScreenSize.screenWidth, height: ScreenSize.screenHeight)
        self.view.addSubview(myView)
        myView.isHidden = true
        
        self.getRecordsWebData()
        // Do any additional setup after loading the view.
    }
    
    func loadInitialSetup() -> Void {
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        self.view.bringSubviewToFront(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let bundle = self.initialiseBundle(ClassString: RecordsTableViewCell.className())
        tableView.register(UINib(nibName: RecordsTableViewCell.className(), bundle: bundle), forCellReuseIdentifier: RecordsTableViewCell.className())
        tableView.bounces = false
    }
    
}

extension JSONViewController {
    
    func getRecordsWebData() -> Void {
        if NetworkManager.sharedInstance.isInternetAvailable(){
            self.showHUD(progressLabel: AlertField.loaderString)
            let jsonUrl : String = UrlName.baseUrl
            let params = ["": ""];
            NetworkManager.sharedInstance.commonNetworkCallWithHeader(header: [:], url: jsonUrl, method: .get, parameters: params, completionHandler: { (json, status) in
                guard let jsonValue = json else {
                    self.dismissHUD(isAnimated: true)
                    return
                }
                self.recordsModelArray = Mapper<RecordsModel>().mapArray(JSONArray: jsonValue as! Array)
                if self.recordsModelArray.count > 0 {
                    self.tableView.reloadData()
                }
                self.dismissHUD(isAnimated: true)
            })
        }else{
            self.showNoInternetAlert()
        }
    }
    //MARK:- Datasource & Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecordsTableViewCell.className()) as! RecordsTableViewCell
        
        let model : RecordsModel = recordsModelArray[indexPath.row]
        cell.idLabel.text = model.id
        cell.typeLabel.text = model.type
        cell.dateLabel.text = model.date
        cell.dataLabel.text = model.data
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordsModelArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.addNibToViewController(className: HeaderView.className(), xPosition: 0, yPosition: 0, nibWidth: ScreenSize.screenWidth, nibHeight: 45)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    //Delegate for sort by type
    func sortbyType(_ sender: UIButton) {
        //Write sorting code here
        // reload table
        self.view.makeToast("Perform sorting on this click")
    }
}

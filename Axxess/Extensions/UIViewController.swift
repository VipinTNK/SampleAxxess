//
//  UIViewController.swift
//  Dummy
//
//  Created by Dummy on 14/6/19..
//  Copyright © 2019 Dummy. All rights reserved.
//

import UIKit
import MBProgressHUD
import SwiftyJSON
import Toast_Swift

extension UIViewController     {
    
    /// Show toast on validation
    ///
    /// - Parameters:
    ///   - messsage: error message
    ///   - position: center, top, bottom
    func showToast(messsage:String, position:ToastPosition){
        var style = ToastStyle()
        style.backgroundColor = CommonMethods.hexStringToUIColor(hex: Color.primaryColor)
        self.view.makeToast(messsage.localiz(), duration: 3.0, position: position, style: style)
    }
    
    /// Showing loader on API call
    ///
    /// - Parameter progressLabel: Loader message
    func showHUD(progressLabel:String){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.bezelView.color = CommonMethods.hexStringToUIColor(hex: Color.primaryColor)
        hud.label.text = progressLabel
        UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = UIColor.white
        //hud.activityIndicatorColor = UIColor.white
        hud.label.textColor = UIColor.white
    }
    
    /// Dismiss loader after API response
    ///
    /// - Parameter isAnimated: animation
    func dismissHUD(isAnimated:Bool) {
        MBProgressHUD.hide(for: self.view, animated: isAnimated)
    }
    
    /// Method to show alert when no internet connection
    func showNoInternetAlert(){
        let alertView = UIAlertController(title: AlertField.oopsString, message: AlertField.noInternetString, preferredStyle: .alert)
        let action = UIAlertAction(title: AlertField.okString, style: .default, handler: { (alert) in
        })
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
    // Add Userdefaults -
    func addElementInUserdefaults(_ value : String, key: String) -> Void {
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: key)
        defaults.synchronize()
    }
    
    func removeElementFromUserdefaults(_ key: String) -> Void {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    func getElementFromUserdefaults(_ key: String) -> String {
        let defaults = UserDefaults.standard
        if defaults.value(forKey: key) != nil {
            return defaults.value(forKey: key) as! String
        }
        return ""
    }
    
    //Remove Userdefaults -
   
    /// Showing generic alert
    ///
    /// - Parameters:
    ///   - title: title of alert
    ///   - message: description of alert
    @objc func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: AlertField.okString.localiz(), style: .default))
        present(ac, animated: true)
    }
    
    func setViewInteractionEnabled(_ status : Bool) -> Void {
        self.view.isUserInteractionEnabled = status
    }
    
    func makeToastInCenterWithMessage(_ message : String) -> Void {
        self.view.makeToast(message.localiz(), duration: 2.0, position:.center)
    }
    
    func makeToastInBottomWithMessage(_ message : String) -> Void {
        self.view.makeToast(message.localiz(), duration: 2.0, position:.bottom)
    }
    
    func makeToastInTopWithMessage(_ message : String) -> Void {
        self.view.makeToast(message.localiz(), duration: 2.0, position:.top)
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func twoDigitFormatted(_ numberValue: Int) -> String {
        return String(format: "%02d", numberValue)
    }
    //Added code for pods
    func initialiseBundle(ClassString : String) -> Bundle {
        let bundle = Bundle(for: self.classForCoder)
        let nib = UINib(nibName: ClassString, bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
        return bundle
    }
    
    func getMainStoryBoardSharedInstance() -> UIStoryboard {
        let bundle = Bundle.init(for: self.classForCoder)
        return UIStoryboard(name: "Main", bundle: bundle)
    }
    
    func getSidemenuStoryBoardSharedInstance() -> UIStoryboard {
        let bundle = Bundle.init(for: self.classForCoder)
         return UIStoryboard(name: "MenuOptions", bundle: bundle) // Update the storyboard name here as text MenuOptionns
    }
    
    func addNibToViewController(className : String, xPosition : CGFloat, yPosition : CGFloat,  nibWidth : CGFloat, nibHeight : CGFloat) -> UIView {
        let bundle = self.initialiseBundle(ClassString: className)
        let nib = bundle.loadNibNamed(className, owner: self, options: nil)?[0] as! UIView
        nib.frame = CGRect(x: xPosition, y: yPosition, width: nibWidth, height: nibHeight)
        nib.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        nib.layer.zPosition = 1
        return nib
    }
    
    func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }
}

//
//  NetworkManager.swift
//  Dummy
//  Created by Dummy on 14/06/19.
//  Copyright © 2019 Dummy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SystemConfiguration

public class NetworkManager {
    
    //MARK: Variable declaration 
    static let sharedInstance = NetworkManager()
    //MARK:- Check Internet Connectivity
    func isInternetAvailable() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    //MARK:- Common Network Service Call with header
    func commonNetworkCallWithHeader(header :[String:String],url:String,method:HTTPMethod,parameters : [String:Any]?,completionHandler:@escaping (Array<Any>?,String?)->Void) {
        let jsonRequest = try! JSONSerialization.data(withJSONObject: parameters!, options: .prettyPrinted)
        if let jsonRequest = String(data: jsonRequest, encoding: .utf8) {
            print("URL====>>>>> \(url) \n Request =====>>>>\(jsonRequest)")
        }
        let configuration = URLSessionConfiguration.background(withIdentifier: "")
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.startRequestsImmediately = true
        //let authHeader = self.getHeaders()
        Alamofire.request(url, method: method, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if(response.result.isSuccess){
                if let data = response.result.value{
                    var  jsonDict : Array<Any>?
                    jsonDict = data as? Array<Any>
                    completionHandler(jsonDict,nil)
                    return
                }
            }
            completionHandler(nil,response.result.error?.localizedDescription)
        }
    }
}
//Class ends here

//
//  ViewModel.swift
//  MvvmDemoPostRequest
//
//  Created by Ravi kumar gupta on 13/03/21.
//

import Foundation
import Alamofire
import UIKit
import RxSwift
import RxRelay



class viewModel {
    
  
    static let sharedInstance = viewModel()
    var singnUpdata : resultData?
    
  
   
    func postApi(_ completion: @escaping () -> Void,firstname:String,lastname:String,MobileNumber:String,email:String,password:String) {
        
      

        let param = ["first_name":firstname,"last_name":lastname,"contact":MobileNumber,"email":email,"password":password,"user_type":"Individual"] as [String:AnyObject]
        
        print(param)
        
        Webservice().startConnectinWithString_PostType(getUrlString:"signup", params:param as [String:AnyObject]) { (receiveData, responceCode) in
            print(receiveData)
            
        
            guard let data = receiveData as? [String:AnyObject] else {
                
                return
            }
            
            do {
                
                if let dataNew = (data as? [String:AnyObject])?["result"] as? [[String:AnyObject]] {
                    
                    
                    let jsonData = try? JSONSerialization.data(withJSONObject:dataNew, options: .prettyPrinted)
                    let updatedData = try? JSONDecoder().decode(resultData.self, from: jsonData!)
                  self.singnUpdata = updatedData
                  
                    completion()
                    
                }
                
                completion()
                
            }
            
            completion()
            
        }
        
        
    }
    
}


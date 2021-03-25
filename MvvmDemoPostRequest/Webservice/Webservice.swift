//
//  Webservice.swift
//  MvvmDemoPostRequest
//
//  Created by Ravi kumar gupta on 13/03/21.
//

import Foundation
import Alamofire

enum metho_Type {
    
    case POST,GET
}

var baseURL = "http://13.234.161.234:3001/"

class Webservice {
    
    static let sharedInstance = Webservice()
    
    var responseCode = 0
    var connectionError = ""
    
    func startConnectinWithString_PostType(getUrlString: String, params getParams: [String: AnyObject],outputBlock:@escaping (_ receivedData: AnyObject,_ responceCode: Int) ->Void){
        
        let url = baseURL + getUrlString
        
        print(url)
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.timeoutInterval = 30
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: getParams, options: [])
        
        Alamofire.request(request as URLRequestConvertible).responseJSON { (responce) in
            
            if responce.response != nil{
                
                if let json = responce.result.value{
                    
                    outputBlock(json as AnyObject,1)
                    
                }else{
                    
                    outputBlock(["Error":responce.error?.localizedDescription] as AnyObject,2)
                    
                }
                
            }else{
                
                outputBlock(["Error":responce.error?.localizedDescription] as AnyObject,3)
                
            }
            
        }
        
    }
    func startConnectionWithString_Getype(getString: String,outputBlock:@escaping (_ receivedData: AnyObject,_ responceCode: Int) -> Void){
        
        let url = baseURL + getString
        
        print(url)
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //  request.timeoutInterval = 600
        
        Alamofire.request(request as URLRequestConvertible).responseJSON { (responce) in
            
            if responce.response != nil{
                
                if let json = responce.result.value{
                    
                    outputBlock(json as AnyObject,1)
                    
                }else{
                    
                    outputBlock(["Error": responce.error?.localizedDescription] as AnyObject,2)
                    
                }
                
            }else{
                
                outputBlock(["Error": responce.error?.localizedDescription] as AnyObject,3)
                
            }
            
        }
        
    }
    
    
}

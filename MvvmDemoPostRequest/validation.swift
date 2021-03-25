//
//  validation.swift
//  MvvmDemoPostRequest
//
//  Created by Ravi kumar gupta on 13/03/21.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {
    
   
    func validateData() -> Bool {
        
        if firstName_TexTfield.text!.replacingOccurrences(of: " ", with: "") == "" {
            
            self.alert(message: "Plaese Enter First Name")
            return false
            
        } else if lastname_TextField.text!.replacingOccurrences(of: " ", with: "") == "" {
            
            self.alert(message: "Plaese Enter Last Name")
            return false
            
        } else if mobileNumber_TextField.text!.replacingOccurrences(of: " ", with: "") == "" {
            
            self.alert(message: "Plaese Enter mobile Name")
            return false
            
        } else if email_TextField.text!.replacingOccurrences(of: " ", with: "") == "" {
            
            self.alert(message: "Plaese Enter email Name")
            return false
            
        } else if password_TextField.text!.replacingOccurrences(of: " ", with: "") == "" {
            
            self.alert(message: "Plaese Enter Password")
            return false
            
        }
        
        return true
        
    }
    
}

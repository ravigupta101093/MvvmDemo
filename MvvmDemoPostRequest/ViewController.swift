//
//  ViewController.swift
//  MvvmDemoPostRequest
//
//  Created by Ravi kumar gupta on 13/03/21.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {
    
    

    
    @IBOutlet weak var firstName_TexTfield: UITextField!
    @IBOutlet weak var lastname_TextField: UITextField!
    @IBOutlet weak var mobileNumber_TextField: UITextField!
    @IBOutlet weak var email_TextField: UITextField!
    @IBOutlet weak var password_TextField: UITextField!
    @IBOutlet weak var confirem_TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       
    }

    @IBAction func submit_Btn(_ sender:UIButton) {
        
        if self.validateData() {
            
            viewModel.sharedInstance.postApi({
                
                print("Data")
            }, firstname: firstName_TexTfield.text!, lastname: lastname_TextField.text!, MobileNumber:mobileNumber_TextField.text!, email: email_TextField.text!, password: password_TextField.text!)
     
        }
        
    }
    
}



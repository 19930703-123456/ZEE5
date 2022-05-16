//
//  LoginViewController.swift
//  zee5
//
//  Created by Sasidhar Reddy on 15/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UnderlinedTextField!
    
    @IBOutlet weak var passwordTextField: UnderlinedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func loginbutton(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}

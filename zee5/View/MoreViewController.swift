//
//  MoreViewController.swift
//  zee5
//
//  Created by Sasidhar Reddy on 14/05/22.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    @IBOutlet weak var emailTextField: UnderlinedTextField!
    
    @IBOutlet weak var loginStackView: UIStackView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "g@g.co"
        
        loginButton.isHidden = false
        loginStackView.isHidden = true
        
        emailTextField.setUnderlineColor(color: .white)
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Placeholder Text",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        goToNextScreen()
        
        
        //
        //        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        //        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
    }
    
    
    
    @IBAction func emailTF(_ sender: Any) {
        
        if let email = emailTextField.text {
            
            if invalidEmail(email) != nil{
                loginStackView.isHidden = false
                loginButton.isHidden = true
            } else {
                loginButton.isHidden = false
                loginStackView.isHidden = true
            }
            
        }
        func invalidEmail(_ value: String) -> String?
        {
            let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            if !predicate.evaluate(with: value)
            {
                return "Invalid Email Address"
            }
            
            return nil
        }
        
        //        checkForValidForm()
    }
    
    @IBAction func loginButtonClick(_ sender: Any) {
        goToNextScreen()
        
    }
    func goToNextScreen() {
        
        loginStackView.isHidden = false
        if let email = emailTextField.text {
            if email.isEmpty{
                loginButton.isHidden = true
                loginStackView.isHidden = false
                return
            } else {
                loginButton.isHidden = false
                loginStackView.isHidden = true
                
                if let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                    vc.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
            }
            
        }
        
    }
        
}

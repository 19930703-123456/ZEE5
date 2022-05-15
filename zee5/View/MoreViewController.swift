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
        
        loginButton.isHidden = true
        loginStackView.isHidden = false
        
        emailTextField.setUnderlineColor(color: .white)
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Placeholder Text",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        
        
//
//        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        navigationController?.navigationBar.titleTextAttributes = textAttributes
       
       
    }
     
    

    @IBAction func emailTF(_ sender: Any) {
        if let email = emailTextField.text {
            
            if let _ = invalidEmail(email) {
                loginStackView.isHidden = false
                loginButton.isHidden = true
            } else {
                loginButton.isHidden = false
                loginStackView.isHidden = true
            }
            
        }
        
//        checkForValidForm()
    }
    
    @IBAction func loginButtonClick(_ sender: Any) {
        
        loginStackView.isHidden = false

                    if let email = emailTextField.text {
            if email.isEmpty{
                loginButton.isHidden = true
                loginStackView.isHidden = false
                return
            } else {
                loginButton.isHidden = false
                loginStackView.isHidden = true
            }
        }
            
            
            
//        if isValidEmail(emailID: emailTextField.text ?? "") == false {
//            loginButton.isHidden = false
//            loginStackView.isHidden = false
//            print("invaild")
//        } else {
//            loginStackView.isHidden = true
//            print("valid")
//
//        }
       
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  MoreViewController.swift
//  zee5
//
//  Created by Sasidhar Reddy on 14/05/22.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
   
    @IBOutlet weak var emailTextField: UITextField!
  
    @IBOutlet weak var loginStackView: UIStackView!
    
    @IBOutlet weak var loginButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = emailTextField.text
       
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
       
       
       
    }
     
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
//        loginButton.isHidden = true
        loginStackView.isHidden = false
    }
   

    @IBAction func loginButtonClick(_ sender: Any) {
        
       
        loginStackView.isHidden = false

        guard let email = emailTextField.text, emailTextField.text?.count != 0  else {
            loginButton.isHidden = false
            loginStackView.isHidden = true
          
            return
            
        }
        
        if isValidEmail(emailID: emailTextField.text ?? "") == false {
            loginButton.isHidden = false
            loginStackView.isHidden = false
            print("invaild")
        } else {
            loginStackView.isHidden = true
            print("valid")}
       
    }
    
    func isValidEmail(emailID:String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: emailID)
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

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
    
    var iconClicked = false
    let imageicon = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageicon.image = UIImage(named: "closed")
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closed")!.size.width, height: UIImage(named: "closed")!.size.height)
        imageicon.frame = CGRect(x:-10, y: 0, width: UIImage(named: "closed")!.size.width, height: UIImage(named: "closed")!.size.height)
        passwordTextField.rightView = contentView
        passwordTextField.rightViewMode = .always
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTap(tap:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tap)
    }
    
    @objc func imageTap(tap:UITapGestureRecognizer) {
        let tappedImage = tap.view as! UIImageView
        if iconClicked
        {
            iconClicked = false
            tappedImage.image = UIImage(named: "open")
            passwordTextField.isSecureTextEntry = false
        } else {
            iconClicked = true
            tappedImage.image = UIImage(named: "closed")
            passwordTextField.isSecureTextEntry = true
        }
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

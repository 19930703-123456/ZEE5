//
//  DownloadViewController.swift
//  zee5
//
//  Created by Sasidhar Reddy on 14/05/22.
//

import UIKit

class DownloadViewController: UIViewController {
    
    // @IBOutlet
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    func setUpUI() {
        // Make circle image
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.layer.masksToBounds = true
        // check username exists or not
        if let userName = UserDefaults.standard.string(forKey: UserDefaultsKeys.userName) {
            userNameLabel.text = userName
            loginLabel.isHidden = true
        } else {
            userNameLabel.text = "Guest"
            loginLabel.isHidden = false
        }
        // Initialize Tap Gesture Recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        // Add Tap Gesture Recognizer
        profileView.addGestureRecognizer(tapGesture)
    }
    
    @objc func didTapImageView(_ sender: UITapGestureRecognizer) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: StoryBoardKeys.loginViewController) as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

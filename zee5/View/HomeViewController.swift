//
//  HomeViewController.swift
//  zee5
//
//  Created by Sasidhar Reddy on 14/05/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
//        option binding through gaurd let
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as? MoreViewController else {
//            return
//        }
//        goToNextScreen()
       
    }
    func goToNextScreen() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MoreViewController") as? MoreViewController {
             vc.hidesBottomBarWhenPushed = true
             self.navigationController?.pushViewController(vc, animated: true)
         }
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

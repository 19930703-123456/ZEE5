//
//  RegisterViewController.swift
//  zee5
//
//  Created by Sasidhar Reddy on 15/05/22.
//

import UIKit

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailIDTextField: UnderlinedTextField!
    @IBOutlet weak var firstNameTextField: UnderlinedTextField!
    @IBOutlet weak var lastNameTextField: UnderlinedTextField!
    @IBOutlet weak var dobTextField: UnderlinedTextField!
    @IBOutlet weak var genderTextField: UnderlinedTextField!
    @IBOutlet weak var setPasswordTextField: UnderlinedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dobTextField.rightViewMode = .always
        dobTextField.rightView = UIImageView(image: UIImage(named:"calender"))
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        
        dobTextField.inputView = datePicker
        dobTextField.text = formatDate(date: Date())
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(RegisterViewController.dismissPicker))
        
        dobTextField.inputAccessoryView = toolBar
        
        
    }
    @objc func dismissPicker() {
        
        view.endEditing(true)
        
    }
    @objc func dateChange(datePicker: UIDatePicker)
    {
        dobTextField.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
    
    
    func registerButton(_ sender: Any) {
    }
    
   
}


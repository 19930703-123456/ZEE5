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
    @IBOutlet weak var genderTableView: UITableView!
    @IBOutlet weak var genderTableViewHC: NSLayoutConstraint!
    
    //    for gender table view
    var iconClicked = false
    let imageicon = UIImageView()
    let gender = ["Male","Female","Other"]
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        for gender table view
        genderTableViewHC.constant = 0
        genderTableView.delegate = self
        genderTableView.dataSource = self
        self.genderTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        
        //        for date of birth
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
        
        //        for gender toggle
        imageicon.image = UIImage(named: "down")
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "down")!.size.width, height: UIImage(named: "down")!.size.height)
        imageicon.frame = CGRect(x:-10, y: 0, width: UIImage(named: "down")!.size.width, height: UIImage(named: "down")!.size.height)
        genderTextField.rightView = contentView
        genderTextField.rightViewMode = .always
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTap(tap:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tap)
        
    }
    
    //    for geneder toggle
    @objc func imageTap(tap:UITapGestureRecognizer) {
        let tappedImage = tap.view as! UIImageView
        if iconClicked
        {
            iconClicked = false
            tappedImage.image = UIImage(named: "up")
            self.genderTableViewHC.constant = 44.0 * 3.0
            
        } else {
            iconClicked = true
            tappedImage.image = UIImage(named: "down")
            self.genderTableViewHC.constant = 0
            
        }
        self.view.layoutIfNeeded()
    }
    
    //    for date picker
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
// for gender tableview
extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gender.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier )!
        
        cell.textLabel?.text = self.gender[indexPath.row]
        cell.backgroundColor = .gray
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        genderTextField.text = ("\(gender[indexPath.row])")
        UIView.animate(withDuration: 0.5) {
            self.genderTableViewHC.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    
}

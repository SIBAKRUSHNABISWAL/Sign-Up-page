//
//  SignUpViewController.swift
//  SignUp-Task-Demo
//
//  Created by Siba on 06/03/20.
//  Copyright © 2020 Mobiotics. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var saveActionButton: UIBarButtonItem!
    
    @IBOutlet weak var termAndConditionSwitch: UISwitch!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var dobTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    var pickerView = UIPickerView()
    let countryNameArr = ["India", "USA", "UK", "Srilanka", "Katar", "South Korea"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePickerpickerView()
        showPickerView()
    }
   
    //MARK:- Action of the save button
    @IBAction func saveActionButton(_ sender: Any) {
        if userNameTextField.text == String() {
            let userNameTextFieldAlert = UIAlertController(title: "User Name ", message: "Please Enter User Name", preferredStyle: .alert)
            userNameTextFieldAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
            }))
            self.present(userNameTextFieldAlert, animated: true, completion: nil)
        } else if emailTextField.text == String() {
            let emailAlert = UIAlertController(title: "Email", message: "Please Enter Email", preferredStyle: .alert)
            emailAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
            }))
            self.present(emailAlert, animated: true, completion: nil)
        } else if passwordTextField.text == String() {
            let passwordAlert = UIAlertController(title: "Password", message: "Please Enter Password", preferredStyle: .alert)
            passwordAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
            }))
            self.present(passwordAlert, animated: true, completion: nil)
        } else if addressTextField.text == String() {
            let addressAlert = UIAlertController(title: "Address", message: "Please Enter Address", preferredStyle: .alert)
            addressAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
            }))
            self.present(addressAlert, animated: true, completion: nil)
        } else if countryTextField.text == String() {
            let contryAlert = UIAlertController(title: "Country", message: "Please Enter Your Country", preferredStyle: .alert)
            contryAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            }))
            self.present(contryAlert, animated: true, completion: nil)
            
        } else if dobTextField.text == String() {
            let dobAlert = UIAlertController(title: "DOB", message: "Please Enter Your DOB", preferredStyle: .alert)
            dobAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
            }))
            self.present(dobAlert, animated: true, completion: nil)
        } else if termAndConditionSwitch.isOn == false {
        let switchAlert = UIAlertController(title: "T&C", message: "Please Enable the Term And Condtion", preferredStyle: .alert)
        switchAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        }))
        self.present(switchAlert, animated: true, completion: nil)
        }
        dobTextField.endEditing(false)
    }
    //MARK:- Show the picker view tab on the country textField
    func showPickerView() {
        pickerView.backgroundColor = .white
        pickerView.delegate = self
        pickerView.dataSource = self
        countryTextField.inputView = pickerView
        func donePicker() {
            countryTextField.resignFirstResponder()
        }
    }
    
    //MARK:- Show the date picker tab on the DOB textField
        func showDatePickerpickerView() {
        let datePicker = UIDatePicker()
               datePicker.datePickerMode = .date
               dobTextField.inputView = datePicker
               datePicker.addTarget(self, action: #selector(self.haldleDatePicker(sender:)), for: .valueChanged)
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.viewBeginTapped(gestureRecognizer:)))
           view.addGestureRecognizer(tapGesture)
    }
    //Action perform for date format
    @objc func haldleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dobTextField.text = dateFormatter.string(from: sender.date)
    }
    // Action perform for hide the date picker
    @objc func viewBeginTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
//MARK:- Use text field delegate methods
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            addressTextField.becomeFirstResponder()
        } else if textField == addressTextField {
            countryTextField.becomeFirstResponder()
            
        }
        return true
    }
    
}
//MARK:- Use picker view date source methods
extension SignUpViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryNameArr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryNameArr[row]
    }
    
}
//MARK:- Use picker view delegate methods
extension SignUpViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countryNameArr[row]
    }
}


//
//  RegisterViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/23/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
   
    @IBAction func signupClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
             if let error = error {
                 let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "OK", style: .default)
                 alertController.addAction(okAction)
                 self.present(alertController, animated: true, completion: nil)
             } else {
                 let alert = UIAlertController(title: "Success", message: "User registered successfully!", preferredStyle: .alert)
                 alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                     self.navigationController?.popViewController(animated: true)
                 }))
                 self.present(alert, animated: true, completion: nil)
             }
         }
     }
}



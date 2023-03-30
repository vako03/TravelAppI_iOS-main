//
//  LoginViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/23/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    private var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        makeFooter()
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
            }
    
    func makeFooter() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: view.frame.minX, y: view.frame.height - 152))
        path.addQuadCurve(to: CGPoint(x: view.frame.maxX, y: view.frame.height - 152 - 14), controlPoint: CGPoint(x: view.frame.midX, y: view.frame.height - 152 + 100))
        path.addLine(to: CGPoint(x: view.frame.maxX, y: view.frame.maxY))
        path.addLine(to: CGPoint(x: view.frame.minX, y: view.frame.maxY))
        path.addLine(to: CGPoint(x: view.frame.minX, y: view.frame.height - 152))
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.blue.cgColor // background color
        
        view.layer.addSublayer(layer)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        // Show the activity indicator view
              activityIndicator.isHidden = false
              activityIndicator.startAnimating()

              guard let email = emailTextField.text else { return }
              guard let password = passwordTextField.text else { return }

              Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
                  // Hide the activity indicator view
                  self.activityIndicator.stopAnimating()

                  if let error = error {
                      let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                      let okAction = UIAlertAction(title: "OK", style: .default)
                      alertController.addAction(okAction)
                      self.present(alertController, animated: true, completion: nil)
                  } else {
                      self.loginUser()
            }
        }
    }
    //test
    @objc func loginUser() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
        navigationController?.pushViewController(mainTabBarController, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    @IBAction func onCreateTapped(_ sender: Any) {
        let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        navigationController?.pushViewController(registerVC, animated: true)
    }

}

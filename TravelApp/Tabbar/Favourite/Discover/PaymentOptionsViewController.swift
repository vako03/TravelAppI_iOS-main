//
//  PaymentOptionsViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 10.05.23.
//

import UIKit

class PaymentOptionsViewController: UIViewController {
    
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var expiryDate: UITextField!
    @IBOutlet weak var cVV: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        guard let cardNameText = cardName.text,
                  let cardNumberText = cardNumber.text,
                  let expiryDateText = expiryDate.text,
                  let cVVText = cVV.text else {
                      showNotification("Please fill in all fields.")
                      return
              }
              
              if cardNameText.isEmpty || cardNumberText.isEmpty || expiryDateText.isEmpty || cVVText.isEmpty {
                  showNotification("Please fill in all fields.")
              } else {
                  showNotification("Payment completed successfully")
                  navigateToPreviousPage()
              }
          }
          
          func showNotification(_ message: String) {
              let alertController = UIAlertController(title: "Notification", message: message, preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                  if self?.areAllFieldsFilled() ?? false {
                      self?.navigateToPreviousPage()
                  }
              }
              alertController.addAction(okAction)
              present(alertController, animated: true, completion: nil)
          }
          
          func navigateToPreviousPage() {
              navigationController?.popViewController(animated: true)
          }
          
          func areAllFieldsFilled() -> Bool {
              guard let cardNameText = cardName.text,
                  let cardNumberText = cardNumber.text,
                  let expiryDateText = expiryDate.text,
                  let cVVText = cVV.text else {
                      return false
              }
              
              return !cardNameText.isEmpty && !cardNumberText.isEmpty && !expiryDateText.isEmpty && !cVVText.isEmpty
          }
      }

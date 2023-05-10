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
    
    @IBOutlet weak var payButton: UIImageView!
    
}

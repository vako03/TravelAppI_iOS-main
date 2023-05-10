//
//  MarsViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 03.05.23.
//

import UIKit

class MarsViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
              button.layer.cornerRadius = button.frame.size.height / 2
              button.clipsToBounds = true
        navigationController?.navigationBar.tintColor = .white

    }
    
    
    
    
    @IBAction func byTicket(_ sender: Any) {
        let paymentOptionsVC = PaymentOptionsViewController(nibName: "PaymentOptionsViewController", bundle: nil)
        navigationController?.pushViewController(paymentOptionsVC, animated: true)
    }

    
}

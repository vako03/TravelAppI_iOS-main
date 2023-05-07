//
//  MoreViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/26/23.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [button1, button2, button3].forEach { button in
                  button.layer.cornerRadius = button.frame.size.height / 2
                  button.clipsToBounds = true
              }
    
    }
    
}
    
  



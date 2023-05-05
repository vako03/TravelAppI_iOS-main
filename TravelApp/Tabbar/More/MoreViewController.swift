//
//  MoreViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/26/23.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func button1(_ sender: Any) {
       
          let exampleVC = MoreViewController()
          addChild(exampleVC)
          exampleVC.view.frame = view.bounds
          view.addSubview(exampleVC.view)
          exampleVC.didMove(toParent: self)
        }
    }
    
  



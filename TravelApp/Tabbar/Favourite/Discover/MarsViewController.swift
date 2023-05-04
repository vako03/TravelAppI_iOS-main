//
//  MarsViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 03.05.23.
//

import UIKit
import HorizonCalendar

class MarsViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        button.layer.cornerRadius = button.frame.size.height / 2
           button.clipsToBounds = true
        
    }
    
    @IBAction func byTicket(_ sender: Any) {
        let calendarVC = CalendarViewController()
        self.navigationController?.pushViewController(calendarVC, animated: true)
        }
    
}

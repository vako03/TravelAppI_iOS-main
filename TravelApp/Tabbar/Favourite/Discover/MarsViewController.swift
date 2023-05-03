//
//  MarsViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 03.05.23.
//

import UIKit
import HorizonCalendar

class MarsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func byTicket(_ sender: Any) {
        let calendarVC = CalendarViewController()
        self.navigationController?.pushViewController(calendarVC, animated: true)
        }
    
}

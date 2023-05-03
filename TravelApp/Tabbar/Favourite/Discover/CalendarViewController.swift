//
//  CalendarViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 03.05.23.
//

import UIKit
import HorizonCalendar

class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCalendar()
        
    }
    
    private func createCalendar() {
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2020, month: 1, day: 1))!
        let endDate = calendar.date(from: DateComponents(year: 2022, month: 12, day: 31))!
        
        let content = CalendarViewContent(
            calendar: calendar,
            visibleDateRange: startDate...endDate,
            monthsLayout: .vertical(options: VerticalMonthsLayoutOptions())
        )
        
        let calendarView = CalendarView(initialContent: content)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.setTitle("Button Title", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            container.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        container.addSubview(calendarView)
        container.addSubview(button)
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: container.topAnchor),
            calendarView.leftAnchor.constraint(equalTo: container.leftAnchor),
            calendarView.rightAnchor.constraint(equalTo: container.rightAnchor),
            button.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
        ])
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        if let url = URL(string: "https://truevo.com/send-payouts/?gclid=CjwKCAjwjMiiBhA4EiwAZe6jQ_bGmfiLtcJHmpLwBljyeAtYBYIcgoQB2GaFQJKkEYqih7CdqhiiXRoCRhkQAvD_BwE") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

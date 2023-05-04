//
//  TabBarViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/26/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let stacView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.spacing = 0
        return sv
    }()
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(stacView)
        
    }
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
        setupLayout()
        setupCustomIndicator()
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stacView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stacView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stacView.bottomAnchor.constraint(equalTo: tabBar.topAnchor),
            stacView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    private func setupCustomIndicator(){
        for index in  0..<(viewControllers?.count ?? 0) {
            let view = UIView()
            view.backgroundColor = index == 0 ? .darkGray : .clear
            stacView.addArrangedSubview(view)
        }
    }
}

extension TabBarViewController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        for (index, subView) in stacView.arrangedSubviews.enumerated(){
            if item.tag == index {
                subView.backgroundColor = .darkGray
            } else {
                subView.backgroundColor = .clear
            }
        }
    }
}

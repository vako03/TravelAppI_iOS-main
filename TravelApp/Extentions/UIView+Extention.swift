//
//  UIView+Extention.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/23/23.
//

import UIKit

extension UIView {
    
  @IBInspectable  var cornerRadius: CGFloat {
      get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}

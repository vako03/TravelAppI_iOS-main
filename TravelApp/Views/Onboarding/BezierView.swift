//
//  Bezierswift
//  TravelApp
//
//  Created by valeri mekhashishvili on 3/30/23.
//

import UIKit

class BezierView: UIView {
    
    private var footerLayer: CAShapeLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    private func setupView() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frame.minX, y: frame.height - 152))
        path.addQuadCurve(to: CGPoint(x: frame.maxX, y: frame.height - 152 - 14), controlPoint: CGPoint(x: frame.midX, y: frame.height - 152 + 100))
        path.addLine(to: CGPoint(x: frame.maxX, y: frame.maxY))
        path.addLine(to: CGPoint(x: frame.minX, y: frame.maxY))
        path.addLine(to: CGPoint(x: frame.minX, y: frame.height - 152))
        
        if footerLayer == nil {
            footerLayer = CAShapeLayer()
            footerLayer?.fillColor = UIColor.systemPurple.cgColor
            layer.addSublayer(footerLayer!)
        }
        
        footerLayer?.path = path.cgPath
    }
}

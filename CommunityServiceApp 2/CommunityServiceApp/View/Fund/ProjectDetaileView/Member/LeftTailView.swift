//
//  TailView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/16.
//

import UIKit

class LeftTailView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frame.width, y: 0))
        
        let cp1 = CGPoint(x: frame.width / 3 * 2, y: frame.height / 6 * 2)
        let cp2 = CGPoint(x: frame.width / 3, y: frame.height / 6 * 3)
        let endPoint1 = CGPoint(x: 0, y: frame.height / 6 * 2)
        
        let cp3 = CGPoint(x: frame.width / 3, y: frame.height / 6 * 5)
        let endPoint2 = CGPoint(x: frame.width, y: frame.height)
        
        path.addCurve(to: endPoint1, controlPoint1: cp1, controlPoint2: cp2)
        path.addCurve(to: endPoint2, controlPoint1: cp3, controlPoint2: cp3)
        path.close()
        
        UIColor.white.setFill()
        path.fill()
    }
}

class RightTailView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        
        let cp1 = CGPoint(x: frame.width / 3, y: frame.height / 6 * 2)
        let cp2 = CGPoint(x: frame.width / 3 * 2, y: frame.height / 6 * 3)
        let endPoint1 = CGPoint(x: frame.width, y: frame.height / 6 * 2)
        
        let cp3 = CGPoint(x: frame.width / 3 * 2, y: frame.height / 6 * 5)
        let endPoint2 = CGPoint(x: 0, y: frame.height)
        
        path.addCurve(to: endPoint1, controlPoint1: cp1, controlPoint2: cp2)
        path.addCurve(to: endPoint2, controlPoint1: cp3, controlPoint2: cp3)
        path.close()
        
        UIColor.white.setFill()
        path.fill()
    }
}

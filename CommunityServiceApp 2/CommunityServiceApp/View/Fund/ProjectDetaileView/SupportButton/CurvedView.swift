//
//  CurveView.swift
//  CommunityServiceApp
//
//  Created by kobayashi emino on 2023/07/18.
//

import UIKit

class CurvedView: UIView {
    
    // MARK: - property
    
    private var startPoint: CGPoint = CGPoint(x: 0, y: 0)
    private var endPoint: CGPoint = CGPoint(x: 0, y: 0)
    private var vertex1: CGPoint = CGPoint(x: 0, y: 0)
    private var vertex2: CGPoint = CGPoint(x: 0, y: 0)
    
    // MARK: - lifecycle
    
    init(frame: CGRect, startPoint: CGPoint, endPoint: CGPoint, vertex1: CGPoint, vertex2: CGPoint) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = customPath()
        UIColor.clear.setStroke()
        path.stroke()
    }
    
    // MARK: - helper
    
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addCurve(to: endPoint, controlPoint1: vertex1, controlPoint2: vertex2)
        
        return path
    }
    
    func animarion(coinView: UIView, fadeOut: CABasicAnimation) {
        
        // 位置のアニメーション
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        positionAnimation.path = customPath().cgPath
        positionAnimation.duration = 1
        
        let timing = CAMediaTimingFunctionName.easeOut.rawValue
        positionAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: timing))
        
        positionAnimation.fillMode = .forwards
        positionAnimation.isRemovedOnCompletion = false
        
        coinView.layer.add(positionAnimation, forKey: nil)
        
        // フェードアウトのアニメーション
        fadeOut.toValue = 0
        fadeOut.duration = 1
        fadeOut.beginTime = CACurrentMediaTime() + 1 // 1秒後にフェードアウトを開始
        
        fadeOut.fillMode = .removed
        fadeOut.isRemovedOnCompletion = true
        
        coinView.layer.add(fadeOut, forKey: nil)
    }
}

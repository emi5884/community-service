//
//  Extensions.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Dowless on 6/19/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import UIKit
//import JGProgressHUD

extension UIColor {
    static var profileViewCellColor: UIColor {
        return UIColor.init(red: 29/255, green: 33/255, blue: 37/255, alpha: 1)
    }
    
    static var titleTextColor: UIColor {
        return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    }
    
    static var backgroundColor: UIColor {
        return UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    }
    
    static var lightBackgroundColor: UIColor {
        return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    
    static var superLightBackgroundColor: UIColor {
        return UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    }
    
    static var earthRed: UIColor {
//        return UIColor(red: 188/255, green: 71/255, blue: 18/255, alpha: 1)
        return UIColor(red: 196/255, green: 54/255, blue: 32/255, alpha: 1)
    }
    
    static var earthYellow: UIColor {
        return UIColor(red: 237/255, green: 170/255, blue: 28/255, alpha: 1)
    }
    
    static var earthLightPink: UIColor {
        return UIColor(red: 212/255, green: 117/255, blue: 107/255, alpha: 1)
    }
    
    static var earthPink: UIColor {
        return UIColor(red: 193/255, green: 73/255, blue: 64/255, alpha: 1)
    }
    
    static var earthDarkBlue: UIColor {
        return UIColor(red: 37/255, green: 74/255, blue: 133/255, alpha: 1)
    }
    
    static var earthBlue: UIColor {
        return UIColor(red: 23/255, green: 105/255, blue: 132/255, alpha: 1)
    }
    
    static var earthLightBlue: UIColor {
        return UIColor(red: 120/255, green: 176/255, blue: 180/255, alpha: 1)
    }
    
    static var earthGreen: UIColor {
        return UIColor(red: 83/255, green: 107/255, blue: 75/255, alpha: 1)
    }
    
    static var earthLightGreen: UIColor {
        return UIColor(red: 148/255, green: 147/255, blue: 15/255, alpha: 1)
    }
    
    static var earthPurple: UIColor {
        return UIColor(red: 147/255, green: 88/255, blue: 95/255, alpha: 1)
    }
    
    static var earthPurpleBlue: UIColor {
        return UIColor(red: 148/255, green: 153/255, blue: 174/255, alpha: 1)
    }
    
    static var earthOrange: UIColor {
        return UIColor(red: 190/255, green: 83/255, blue: 10/255, alpha: 1)
    }
    
    static var earthLightOrange: UIColor {
        return UIColor(red: 226/255, green: 121/255, blue: 49/255, alpha: 1)
    }
    
    static var earthChocolate: UIColor {
        return UIColor(red: 125/255, green: 102/255, blue: 89/255, alpha: 1)
    }
    
    static var lineColor: UIColor {
        return UIColor(red: 140/255, green: 171/255, blue: 216/255, alpha: 1)
    }
    
    static func getDarkerColor(color: UIColor) -> UIColor {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            // 色を調整して暗くする
            let darkerRed = max(0, red - 0.1)
            let darkerGreen = max(0, green - 0.1)
            let darkerBlue = max(0, blue - 0.1)

            return UIColor(red: darkerRed, green: darkerGreen, blue: darkerBlue, alpha: alpha)
        }
        return color
    }
}

extension UIViewController {
//    static let hud = JGProgressHUD(style: .dark)
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
    
    func showLoader(_ show: Bool) {
        view.endEditing(true)
        
        if show {
//            UIViewController.hud.show(in: view)
        } else {
//            UIViewController.hud.dismiss()
        }
    }
    
    func showMessage(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension UIButton {
    func attributedTitle(firstPart: String, secondPart: String) {
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: "\(firstPart) ", attributes: atts)
        
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 16)]
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: boldAtts))
        
        setAttributedTitle(attributedTitle, for: .normal)
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func getCellWidth(category: String, size: CGFloat) -> CGFloat {
        let content = category as NSString
        let attr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: size)]
        let contentSize = content.size(withAttributes: attr)
        let width = max(contentSize.width + 10, 60)
        return width
    }
    
    func getCategoryWidth(category: String) -> CGFloat {
        let content = category as NSString
        let attr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 16)]
        let contentSize = content.size(withAttributes: attr)
        let width = contentSize.width + 30
        return width
    }
    
    func getCellHeight(text: String, fontSize: CGFloat) -> CGFloat {
        let content = text as NSString
        let attr: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: fontSize)]
        let contentSize = content.size(withAttributes: attr)
        let height = contentSize.height
        return height
    }
}

extension UILabel {
    
    func adjustLineSpace() {
        guard let text = self.text else { return }
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3.0
        
        let attr: [NSAttributedString.Key: Any] = [.paragraphStyle: style]
        let attrText = NSAttributedString(string: text, attributes: attr)
        self.attributedText = attrText
    }
}

extension UIFont {
    
    static func zenKakuBold(size: CGFloat) -> UIFont {
        return UIFont(name: "ZenKakuGothicNew-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func zenKakuMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "ZenKakuGothicNew-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}

extension UIButton {
    static func imageButton(image: UIImage, height: CGFloat) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = height / 2
        
        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.setDimensions(height: height * 0.7, width: height * 0.7)
        
        button.addSubview(iv)
        iv.centerX(inView: button)
        iv.centerY(inView: button)
        
        return button
    }
}

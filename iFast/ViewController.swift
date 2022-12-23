//
//  ViewController.swift
//  iFast
//
//  Created by Kakha Sepashvili on 23.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let dashboardBar: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "MenuBar"), for: .normal)
        return button
    }()
    private let notificationBell: UIButton = {
        let button = UIButton()
         button.setImage(UIImage(named: "IconBell"), for: .normal)
         return button
    }()
    private let dashboardText: UILabel = {
       let text = UILabel()
        text.text = "Dashboard"
        text.font = UIFont(name: "helvetica", size: 15)
        text.textColor = .black
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        [dashboardText, dashboardBar, notificationBell].forEach({view.addSubview($0)})
   
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dashboardText.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 70, left: (UIScreen.main.bounds.width / 2) - 35, bottom: 0, right:  0))
        dashboardBar.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: dashboardText.leadingAnchor, padding: .init(top: 70, left: 10, bottom: 0, right: 130))
        notificationBell.anchor(top: view.topAnchor, leading: dashboardText.trailingAnchor, trailing: view.trailingAnchor, padding: .init(top: 70, left: 30, bottom: 0, right: 10))
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}


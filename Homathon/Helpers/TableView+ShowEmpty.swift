//
//  TableView+ShowEmpty.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//


import UIKit


extension UITableView {
    
    var EmptyStackTag: Int { return  214512 }
    
    func showEmpty(image: UIImage? = nil, imageTintColor: UIColor? = nil, message: String, color: UIColor = .lightGray, font: UIFont = Constants.Font.defaultFont(size: 13), stackOffset: CGSize = CGSize(width: 0, height: 0), includesSignInButton:Bool = false) {
            guard !subviews.contains(where: {$0.tag==EmptyStackTag}) else { return }
            
            let imageView = UIImageView()
            let label = UILabel()
            
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = imageTintColor
            
            label.text = message
            label.textAlignment = .center
            label.textColor = color
            label.font = font
            label.numberOfLines = 2
            
            let stackView = UIStackView(arrangedSubviews: [imageView, label])
            stackView.axis = .vertical
            stackView.spacing = 12
            stackView.tag = EmptyStackTag
            
            addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: stackOffset.width),
                stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: stackOffset.height),
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 12),
                stackView.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -12)
                ])
            imageView.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 120).isActive = true
        }

        func removeEmpty() {
            viewWithTag(EmptyStackTag)?.removeFromSuperview()
        }
        
}
    

    


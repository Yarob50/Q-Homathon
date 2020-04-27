//
//  CGAffineTransform.swift
//  TeamPlusApp
//
//  Created by Ammar AlTahhan on 20/01/2019.
//  Copyright © 2019 Ammar AlTahhan. All rights reserved.
//

import Foundation
import UIKit

extension CGAffineTransform {
    enum Direction {
        case left, right, top, bottom
    }
    init(outside bounds: CGRect, from side: Direction) {
        var x: CGFloat = 0
        var y: CGFloat = 0
        switch side {
        case .left:
            x = -(bounds.width)
        case .right:
            x = (bounds.width)
        case .top:
            y = -(bounds.height)
        case .bottom:
            y = (bounds.height)
        }
        
        self.init(translationX: x, y: y)
    }
    mutating func animateIdentity(withDuration: TimeInterval, usingDamping: CGFloat, options: UIView.AnimationOptions, completion: ((Bool)->Void)? = nil) {
        var selfObject = self
        UIView.animate(withDuration: withDuration, delay: 0, usingSpringWithDamping: usingDamping, initialSpringVelocity: 0, options: options, animations: {
            selfObject = .identity
        }, completion: completion)
    }
}

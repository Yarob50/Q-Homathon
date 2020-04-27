//
//  CustomizableView.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/21/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit

class CustomizableView: UIView {

    private var gradientLayer: CAGradientLayer!

        @IBInspectable var topColor: UIColor = .white {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var bottomColor: UIColor = .white {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var shadowColor: UIColor = .clear {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var shadowX: CGFloat = 0 {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var shadowY: CGFloat = 0 {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var shadowBlur: CGFloat = 4 {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var startPointX: CGFloat = 0.5 {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var startPointY: CGFloat = 0 {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var endPointX: CGFloat = 0.5 {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var endPointY: CGFloat = 1 {
            didSet {
                setNeedsLayout()
            }
        }

        @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet {
                setNeedsLayout()
            }
        }

        var startPoint: CGPoint? {
            didSet {
                guard let startPoint = startPoint else { return }
                startPointX = startPoint.x
                startPointY = startPoint.y
            }
        }

        var endPoint: CGPoint? {
            didSet {
                guard let endPoint = endPoint else { return }
                endPointX = endPoint.x
                endPointY = endPoint.y
            }
        }

        override class var layerClass: AnyClass {
            return CAGradientLayer.self
        }

        override func layoutSubviews() {
            self.gradientLayer = self.layer as? CAGradientLayer
            self.gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
            self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
            self.gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
            self.layer.shadowRadius = shadowBlur
            self.layer.shadowOpacity = 1

        }

        func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
            let fromColors = self.gradientLayer?.colors
            let toColors: [AnyObject] = [ newTopColor.cgColor, newBottomColor.cgColor]
            self.gradientLayer?.colors = toColors
            let animation : CABasicAnimation = CABasicAnimation(keyPath: "colors")
            animation.fromValue = fromColors
            animation.toValue = toColors
            animation.duration = duration
            animation.isRemovedOnCompletion = true
            animation.fillMode = .forwards
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            self.gradientLayer?.add(animation, forKey:"animateGradient")
        }
    }

//
//  CustomizableButton.swift
//  Alloha
//
//  Created by يعرب المصطفى on 11/2/16.
//  Copyright © 2016 yarob. All rights reserved.
//

import UIKit
import Spring
import Pulsator

@IBDesignable class CustomizableButton: SpringButton {
    
    var shadowRadiusSteps:Float = 20.0
    @IBInspectable var radius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = radius;
        }
    }
    
    @IBInspectable var yShadow:CGFloat = 0
        {
        didSet{
            layer.shadowOffset = CGSize(width: 0, height: yShadow)
        }
    }
    
    @IBInspectable var shadowOpacity:Float = 0
        {
        didSet{
            layer.shadowOpacity = shadowOpacity/shadowRadiusSteps
        }
    }

    
    @IBInspectable var shadowColor:UIColor = UIColor.black
        {
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }

    
    ///////////////BORDER///////////
    @IBInspectable var borderWidth:CGFloat = 0
        {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.black
        {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var shadowRadius:CGFloat = 0
        {
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var cornerRad:CGFloat = 0
        {
        didSet{
            self.layer.cornerRadius = cornerRad
        }
    }
    
    @IBInspectable var isCircled:Bool = false
        {
        didSet{
            if isCircled
            {
                self.layer.cornerRadius = self.frame.height/2
            }else
            {
                self.layer.cornerRadius = 0
            }
            
        }
    }
    
    
}

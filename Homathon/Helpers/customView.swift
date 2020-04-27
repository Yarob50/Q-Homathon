//
//  CustomizableView.swift
//  تطبيق كرام
//
//  Created by يعرب المصطفى on 8/11/16.
//  Copyright © 2016 يعرب المصطفى. All rights reserved.
//

import UIKit
import Spring

@IBDesignable class CustomView: SpringView {
    
    //this variable is used to determine the graduation steps when you increas or decrease the value of shadow radius
    var shadowRadiusSteps:Float = 20.0
    @IBInspectable var cornerRad:CGFloat = 0
        {
        didSet{
            self.layer.cornerRadius = cornerRad
        }
    }
    
    
    
    
    @IBInspectable var yShadow:CGFloat = 0
        {
        didSet{
            layer.shadowOffset = CGSize(width: xShadow, height: yShadow)
        }
    }
    
    @IBInspectable var xShadow:CGFloat = 0
        {
        didSet{
            layer.shadowOffset = CGSize(width: xShadow, height: yShadow)
        }
    }
    
    @IBInspectable var shadowOpacity:Float = 0
        {
        didSet{
            layer.shadowOpacity = shadowOpacity/shadowRadiusSteps
        }
    }
    
    
    @IBInspectable var shadowRadius:CGFloat = 0
        {
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    
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

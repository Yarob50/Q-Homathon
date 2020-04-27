//
//  UIView+Extension.swift
//  FintechHackathon_ios
//
//  Created by يعرب المصطفى on 4/5/19.
//  Copyright © 2019 yarob. All rights reserved.
//

import Foundation
import UIKit
import Pulsator

extension UIView{
    
//    var numPulse = 3
//    var radius = 240.0
    
    
    @IBInspectable var pulsable: Bool{
        get{
            return self.pulsable
        }
        set (hasDone) {
            if hasDone{
                setPulsable()
            }
        }
    }
    
    
    @IBInspectable var smallPulsable: Bool{
        get{
            return self.smallPulsable
        }
        set (hasDone) {
            if hasDone{
                setSmallPulsable()
            }
        }
    }
    
    func setPulsable(){
        let pulsator = Pulsator()
        pulsator.numPulse = 2
        pulsator.radius = 100.0
        pulsator.backgroundColor = Constants.Colors.pulseColor.cgColor
        self.layer.addSublayer(pulsator)
        pulsator.start()
    }
    
    func setSmallPulsable(){
        let pulsator = Pulsator()
        pulsator.numPulse = 1
        pulsator.radius = 50.0
        pulsator.backgroundColor = Constants.Colors.pulseColor.cgColor
        self.layer.addSublayer(pulsator)
        pulsator.start()
    }
}

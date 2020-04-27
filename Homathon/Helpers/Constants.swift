//
//  Constants.swift
//  GoParking
//
//  Created by Ammar AlTahhan on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit

struct Constants {
    struct Storyboard {
        static let Main = UIStoryboard(name: "Main", bundle: nil)
        static let MapVC = UIStoryboard(name: "MapVC", bundle: nil)
        static let LogsVC = UIStoryboard(name: "LogsVC", bundle: nil)
        static let BillsVC = UIStoryboard(name: "BillsVC", bundle: nil)
    }
    
    struct Colors {
        static let mainColor = UIColor(hex: "0288D1")
        static let secondColor = UIColor(hex: "D96C00")
        static let thirdColor = UIColor(hex: "26A69A")
        
        static let pulseColor = UIColor(hex: "cfd8dc")
        static let mainGradient = [UIColor(hex: "#0cebeb"), UIColor(hex: "#20e3b2"), UIColor(hex: "#29ffc6")]
        static let mainGradient2 = [UIColor(hex: "#1A2980"), UIColor(hex: "#26D0CE")]
    }
    
    struct Font {
        static func defaultFont(size: CGFloat) -> UIFont {
            return UIFont(name: "GE SS Two", size: size)!
        }
        static func defaultMediumFont(size: CGFloat) -> UIFont {
            return UIFont(name: "GE SS Two", size: size)!
        }
        static func defaultLightFont(size: CGFloat) -> UIFont {
            return UIFont(name: "GE SS Two", size: size)!
        }
    }
}

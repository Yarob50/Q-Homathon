//
//  AlertManager.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import Foundation
import SCLAlertView

class AlertManager{
    public static func getAlert(doneHandler: @escaping()->() = {}) -> SCLAlertView{
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "GE SS Two", size: 20)!,
            kTextFont: UIFont(name: "GE SS Two", size: 14)!,
            kButtonFont: UIFont(name: "GE SS Two", size: 14)!,
            showCloseButton: false
        )
        let alert = SCLAlertView(appearance: appearance)
        alert.addButton("تم") {
            doneHandler()
        }
        return alert
    }
    
    public static func showErrorAlert(message: String){
        let alert = AlertManager.getAlert()
        alert.showError("خطأ", subTitle: message)
        
    }
}

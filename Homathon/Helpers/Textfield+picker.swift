//
//  Textfield+picker.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/23/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit
extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector, type: String = "date") {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.datePickerMode = type == "date" ? .date : .time
        datePicker.backgroundColor = UIColor.white
        datePicker.minimumDate = Date()
        datePicker.locale = Locale(identifier: "ar")
        self.inputView = datePicker
        
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        toolBar.barTintColor = Constants.Colors.mainColor
        toolBar.tintColor = UIColor.white
        toolBar.layer.shadowColor = UIColor.black.cgColor
        toolBar.layer.shadowOpacity = 0.15
        toolBar.isTranslucent = false
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "إلغاء", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "تم", style: .plain, target: target, action: selector) //7
        barButton.setTitleTextAttributes([NSAttributedString.Key.font: Constants.Font.defaultFont(size: 16)], for: .normal)
        cancel.setTitleTextAttributes([NSAttributedString.Key.font: Constants.Font.defaultFont(size: 16)], for: .normal)
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}

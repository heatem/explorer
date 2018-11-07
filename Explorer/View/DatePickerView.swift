//
//  DatePickerView.swift
//  Explorer
//
//  Created by Heather Mason on 11/7/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit

class DatePickerView: UIView {
    let diveDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.backgroundColor = .white
        return datePicker
    }()
    
    let pickerToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = false
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(setDate))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        return toolbar
    }()
    
    @objc func setDate() {
        
        // TODO: Show date picker, styled, with done (and cancel?) button, and return date
        // TODO: Styling: don't take up the whole screen
        print("button pressed")
        
        
        
    }
}

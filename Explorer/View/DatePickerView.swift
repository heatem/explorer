//
//  DatePickerView.swift
//  Explorer
//
//  Created by Heather Mason on 11/16/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit

enum DatePickerMode {
    case dateAndTime
    case date
    case time
}

class DatePickerView: UIView {
    
    let picker = UIDatePicker()
    let toolbar: UIToolbar = {
        let bar = UIToolbar()
        let flexspace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)
        bar.setItems([flexspace, doneButton], animated: false)
        bar.sizeToFit()
        return bar
    }()

    init(type: DatePickerMode = .dateAndTime) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(picker)
        addSubview(toolbar)
        
        installConstraints()
    }
    
    func installConstraints() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.heightAnchor.constraint(equalToConstant: 172).isActive = true
        picker.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        picker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.bottomAnchor.constraint(equalTo: picker.topAnchor).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        toolbar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        toolbar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

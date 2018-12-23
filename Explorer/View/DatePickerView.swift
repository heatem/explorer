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
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(red: 0/255.0, green: 122/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        return button
    }()

    init(type: DatePickerMode = .dateAndTime) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(doneButton)
        addSubview(picker)
        
        installConstraints()
    }
    
    func installConstraints() {
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.topAnchor.constraint(equalTo: doneButton.bottomAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        picker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  DatePickerView.swift
//  Explorer
//
//  Created by Heather Mason on 11/16/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit

enum DatePickerType {
    case normal
    case date
    case time
}

class DatePickerView: UIView {
    
    let picker = UIDatePicker()
    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    init(type: DatePickerType = .normal) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        addSubview(doneButton)
        addSubview(picker)
        
        configureWith(type)
        
        installConstraints()
    }
    
    func installConstraints() {
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.topAnchor.constraint(equalTo: doneButton.bottomAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        picker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func configureWith(_ type: DatePickerType) {
        switch type {
            case .date:
                picker.datePickerMode = .date
                // configure picker with just date (no time)
            case .time: () // configure picker with just time here
            default: ()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

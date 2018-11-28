//
//  CreateLogViewController.swift
//  Explorer
//
//  Created by Heather Mason on 9/4/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import Foundation
import UIKit

// create the function to send data to the database in this file.

class CreateLogViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize.height = 1200
        view.backgroundColor = .lightGray
        return view
    }()
    
    let createLogView = CreateLogView()
    let datePickerView = DatePickerView()
    
    var datePickerBottomConstraint: NSLayoutConstraint?
    
    var selectedDatePickerButton: UIButton?
    
    var diveLogDictionary = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(createLogView)
        view.addSubview(scrollView)
        view.addSubview(datePickerView)
        
        datePickerView.doneButton.addTarget(self, action: #selector(setDate), for: .touchUpInside)
        createLogView.diveDateButton.addTarget(self, action: #selector(presentPicker(button:)), for: .touchUpInside)
        createLogView.startTimeButton.addTarget(self, action: #selector(presentPicker(button:)), for: .touchUpInside)
        createLogView.endTimeButton.addTarget(self, action: #selector(presentPicker(button:)), for: .touchUpInside)
        
        installConstraints()
    }
    
    func installConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        createLogView.translatesAutoresizingMaskIntoConstraints = false
        createLogView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        createLogView.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        createLogView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        createLogView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        // Date Picker view
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        datePickerBottomConstraint = datePickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 216)
        datePickerBottomConstraint?.isActive = true
        datePickerView.heightAnchor.constraint(equalToConstant: 216).isActive = true
        datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func setDate() {
        datePickerBottomConstraint?.constant = 216
        
        UIView.animate(withDuration: 0.34) {
            self.view.layoutIfNeeded()
        }
        
        switch selectedDatePickerButton {
            case createLogView.diveDateButton:
                diveLogDictionary["diveDate"] = datePickerView.picker.date
                let formatter = DateFormatter()
                formatter.dateFormat = "dd MMM yyyy"
                createLogView.diveDateButton.setTitle("  \(formatter.string(from: diveLogDictionary["diveDate"] as! Date))", for: .normal)
            case createLogView.startTimeButton:
                diveLogDictionary["diveStartTime"] = datePickerView.picker.date
                let formatter = DateFormatter()
                formatter.dateFormat = "h:mm a"
                createLogView.startTimeButton.setTitle("  \(formatter.string(from: diveLogDictionary["diveStartTime"] as! Date))", for: .normal)
            case createLogView.endTimeButton:
                diveLogDictionary["diveEndTime"] = datePickerView.picker.date
                let formatter = DateFormatter()
                formatter.dateFormat = "h:mm a"
                createLogView.endTimeButton.setTitle("  \(formatter.string(from: diveLogDictionary["diveEndTime"] as! Date))", for: .normal)
        default: ()
        }
    }
    
    @objc func presentPicker(button: UIButton) {
        datePickerBottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.34) {
            self.view.layoutIfNeeded()
        }
        
        selectedDatePickerButton = button
        switch selectedDatePickerButton {
            case createLogView.diveDateButton: datePickerView.configureWith(.date)
            case createLogView.startTimeButton, createLogView.endTimeButton: datePickerView.configureWith(.time)
            default: datePickerView.configureWith(.normal)
        }
    }
}


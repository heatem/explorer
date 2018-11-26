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
    
//    let dateFormatter: DateFormatter = {
//        //
//    }()
    
    var diveLogDiction = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(createLogView)
        view.addSubview(scrollView)
        view.addSubview(datePickerView)
        
        datePickerView.doneButton.addTarget(self, action: #selector(setDate), for: .touchUpInside)
        createLogView.diveDateButton.addTarget(self, action: #selector(presentPicker(button:)), for: .touchUpInside)
        
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
            case createLogView.diveDateButton: () // update title of button, and save the date to a global variable
//            case createLogView.
            // This should be the start time button
            // create case for end time button once label is changed to button
        default: ()
        }
        // which date/time is this? (dive date? dive time?)
        // change button title to formatted date
//        createLogView.diveDateButton.setTitle(datePickerView.picker.date, for: .normal)
        print(datePickerView.picker.date)
    }
    
    @objc func presentPicker(button: UIButton) {
        datePickerBottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.34) {
            self.view.layoutIfNeeded()
        }
        
//        datePickerView.configureWith(.date) // this made the picker show a date instead of date and time. figure out how to make it switch! Thinking I should be able to switch on the button that is passed in.
        // set a variable to identify the sender
        selectedDatePickerButton = button
        switch selectedDatePickerButton {
            case createLogView.diveDateButton: datePickerView.configureWith(.date)
            default: datePickerView.configureWith(.normal)
        }
        print(selectedDatePickerButton)
    }
}

// set a variable for the field calling the picker so you can determine which field to update and which data point to set the date for (to send to the database). don't worry about delegate.
// set type for the date picker

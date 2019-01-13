//
//  CreateLogViewController.swift
//  Explorer
//
//  Created by Heather Mason on 9/4/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import Foundation
import UIKit

class CreateLogViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize.height = 1300
        view.backgroundColor = .lightGray
        return view
    }()
    
    let createLogView = CreateLogView()
    let datePickerView = DatePickerView()
    
    var datePickerBottomConstraint: NSLayoutConstraint?
    
    var selectedDatePickerButton: UIButton?
    
    var diveDate = Date()
    var diveStartTime = Date()
    var diveEndTime = Date()
    
    var inputOffset: CGFloat = 200.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(createLogView)
        view.addSubview(scrollView)
        view.addSubview(datePickerView)
        
        datePickerView.toolbar.items?[1].action = #selector(setDate)
        createLogView.diveDateButton.addTarget(self, action: #selector(presentPicker(button:)), for: .touchUpInside)
        createLogView.startTimeButton.addTarget(self, action: #selector(presentPicker(button:)), for: .touchUpInside)
        createLogView.endTimeButton.addTarget(self, action: #selector(presentPicker(button:)), for: .touchUpInside)
        
        createLogView.saveDiveButton.addTarget(self, action: #selector(saveDive), for: .touchUpInside)
        
        installConstraints()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissInputView))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func installConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        createLogView.translatesAutoresizingMaskIntoConstraints = false
        createLogView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        createLogView.heightAnchor.constraint(equalToConstant: 1300).isActive = true
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
        
        var buttonTitle = ""
        let formatter = DateFormatter()
        
        switch selectedDatePickerButton {
            case createLogView.diveDateButton:
                diveDate = datePickerView.picker.date
                formatter.dateFormat = "dd MMM yyyy"
                buttonTitle = formatter.string(from: diveDate)
            case createLogView.startTimeButton:
                diveStartTime = datePickerView.picker.date
                formatter.dateFormat = "h:mm a"
                buttonTitle = formatter.string(from: diveStartTime)
            case createLogView.endTimeButton:
                diveEndTime = datePickerView.picker.date
                formatter.dateFormat = "h:mm a"
                buttonTitle = formatter.string(from: diveEndTime)
        default: ()
        }
        
        selectedDatePickerButton?.setTitle("  \(buttonTitle)", for: .normal)
    }
    
    @objc func presentPicker(button: UIButton) {
        dismissInputView()
        
        datePickerBottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.34) {
            self.view.layoutIfNeeded()
        }
        
        var pickerFocus: CGFloat = 0.0
        
        selectedDatePickerButton = button
        switch selectedDatePickerButton {
            case createLogView.diveDateButton:
                datePickerView.picker.datePickerMode = .date
                pickerFocus = createLogView.diveDateButton.frame.origin.y
            case createLogView.startTimeButton, createLogView.endTimeButton: datePickerView.picker.datePickerMode = .time
                pickerFocus = createLogView.startTimeButton.frame.origin.y
            default: datePickerView.picker.datePickerMode = .dateAndTime
        }
        
        movesScrollview(to: pickerFocus, for: inputOffset)
    }
    
    @objc func saveDive() {
        let user = User(fullName: "Jacques Cousteau", username: "JaC", icon: "")
        let diveNumber = createLogView.diveNumberTextField.text
        let diveDepth = createLogView.diveDepthSlider.value
        let diveLocation = Location(name: createLogView.locationTextField.text ?? "Unknown", lat: 33.00, lon: -117.29)
        var entryType: EntryType = .boat
        switch createLogView.entryTypeControl.selectedSegmentIndex {
            case 0: entryType = EntryType.boat
            default: entryType = EntryType.shore
        }
        var waterType: WaterType = .salt
        switch createLogView.waterTypeControl.selectedSegmentIndex {
            case 0: waterType = WaterType.salt
            default: waterType = WaterType.fresh
        }
        let diveNotes = createLogView.notesTextView.text
        let diveBuddies = [User(fullName: "Full Name", username: createLogView.buddiesTextField.text ?? "", icon: "")]
        
        let log = DiveLog(
            diveNumber: Int(diveNumber ?? "0") ?? 0,
            date: diveDate,
            depth: Int(diveDepth),
            location: diveLocation,
            entryType: entryType,
            waterType: waterType,
            timeIn: diveStartTime,
            timeOut: diveEndTime,
            notes: diveNotes,
            user: user,
            buddies: diveBuddies
        )
    }

    @objc func dismissInputView() {
        self.view.endEditing(true)
        
        dismissPickerView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillShow(notification: Notification) {
        dismissPickerView()
        
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = keyboardSize.cgRectValue
        inputOffset = view.frame.height - (keyboardFrame.height + 18)
        
        var keyboardFocus: CGFloat = 0.0
        
        if createLogView.diveNumberTextField.isFirstResponder {
            keyboardFocus = createLogView.diveNumberTextField.frame.origin.y
        }

        if createLogView.locationTextField.isFirstResponder {
            keyboardFocus = createLogView.locationTextField.frame.origin.y
        }

        if createLogView.notesTextView.isFirstResponder {
            keyboardFocus = createLogView.notesTextView.frame.origin.y + 36
        }

        if createLogView.buddiesTextField.isFirstResponder {
            keyboardFocus = createLogView.buddiesTextField.frame.origin.y
        }
        
        movesScrollview(to: keyboardFocus, for: inputOffset)
    }
    
    func dismissPickerView() {
        datePickerBottomConstraint?.constant = 216
        UIView.animate(withDuration: 0.34) {
            self.view.layoutIfNeeded()
        }
    }
    
    func movesScrollview(to inputFocus: CGFloat, for inputOffset: CGFloat) {
        let spaceAboveKeyboard = view.frame.height - inputOffset
        if spaceAboveKeyboard != inputFocus {
            scrollView.setContentOffset(CGPoint(x: 0, y: inputOffset - (view.frame.height - inputFocus)), animated: true)
        }
    }
}

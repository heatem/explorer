//
//  CreateLogView.swift
//  Explorer
//
//  Created by Heather Mason on 9/4/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import Foundation
import UIKit

class CreateLogView: UIView {
    
//    diveNumber - Text field with number pad
    let diveNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Dive Number"
        return label
    }()
    
    let diveNumberTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont(name: "Roboto-Regular", size: 17)
        textfield.borderStyle = .roundedRect
        textfield.clearsOnBeginEditing = true
        return textfield
    }()

//    Date
    let diveDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Dive Date:"
        return label
    }()
    
    //    TODO: auto-populate with current date
    let diveDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.backgroundColor = .white
        return datePicker
    }()
    
//    Depth - min label, max label, and a slider
    let diveDepthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Dive Depth:"
        return label
    }()
    
    let minDepthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Min"
        return label
    }()
    
    let maxDepthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Max"
        label.textAlignment = .right
        return label
    }()
    
    let diveDepthSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 130.0
        return slider
    }()
    
//    Location - Text field. user should be able to enter lat/long, or an address. Needs to create a Location object (name, lat, lon)
    let diveLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Dive Location:"
        return label
    }()
    
    let locationTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont(name: "Roboto-Regular", size: 17)
        textfield.borderStyle = .roundedRect
        textfield.clearsOnBeginEditing = false
        return textfield
    }()
    
//    EntryType - Segmented control
    let entryTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Entry Type:"
        return label
    }()
    
    let entryTypeControl: UISegmentedControl = {
        let entryTypes = ["Boat", "Shore"]
        let segmentedControl = UISegmentedControl(items: entryTypes)
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
//    waterType - Segmented control
    let waterTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Water Type:"
        return label
    }()
    
    let waterTypeControl: UISegmentedControl = {
        let entryTypes = ["Salt", "Fresh"]
        let segmentedControl = UISegmentedControl(items: entryTypes)
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
//    timeIn - time selector
    let startTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Start Time:"
        return label
    }()
    
    let startTimePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = UIDatePickerMode.time
        timePicker.backgroundColor = .white
        return timePicker
    }()
    
//    timeOut - time selector
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "End Time:"
        return label
    }()
    
    let endTimePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = UIDatePickerMode.time
        timePicker.backgroundColor = .white
        return timePicker
    }()
    
//    Notes - text field
    let notesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Notes:"
        return label
    }()
    
    let notesTextView: UITextView = {
        let textview = UITextView()
        textview.textColor = .black
        textview.font = UIFont(name: "Roboto-Regular", size: 17)
        textview.layer.cornerRadius = 8
        return textview
    }()
    
//    Buddies - text field
    let buddiesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Dive Buddies:"
        return label
    }()
    
    let buddiesTextField: UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.font = UIFont(name: "Roboto-Regular", size: 17)
        textfield.borderStyle = .roundedRect
        textfield.clearsOnBeginEditing = false
        return textfield
    }()
    
    let submitButton: UIButton = {
        let button = UIButton()
        
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(diveNumberLabel)
        addSubview(diveNumberTextField)
        addSubview(diveDateLabel)
        addSubview(diveDatePicker)
        addSubview(diveDepthLabel)
        addSubview(minDepthLabel)
        addSubview(maxDepthLabel)
        addSubview(diveDepthSlider)
        addSubview(diveLocationLabel)
        addSubview(locationTextField)
        addSubview(entryTypeLabel)
        addSubview(entryTypeControl)
        addSubview(waterTypeLabel)
        addSubview(waterTypeControl)
        addSubview(startTimeLabel)
        addSubview(startTimePicker)
        addSubview(endTimeLabel)
        addSubview(endTimePicker)
        addSubview(notesLabel)
        addSubview(notesTextView)
        addSubview(buddiesLabel)
        addSubview(buddiesTextField)
        
        installConstraints()
    }
    
    func installConstraints() {
        
        // Dive Number constraints
        diveNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        diveNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        diveNumberLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        diveNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        diveNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        diveNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        diveNumberTextField.topAnchor.constraint(equalTo: diveNumberLabel.bottomAnchor, constant: 8).isActive = true
        diveNumberTextField.heightAnchor.constraint(equalToConstant: 54).isActive = true
        diveNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        diveNumberTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        // Dive Date constraints
        diveDateLabel.translatesAutoresizingMaskIntoConstraints = false
        diveDateLabel.topAnchor.constraint(equalTo: diveNumberTextField.bottomAnchor, constant: 18).isActive = true
        diveDateLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        diveDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        diveDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        diveDatePicker.translatesAutoresizingMaskIntoConstraints = false
        diveDatePicker.topAnchor.constraint(equalTo: diveDateLabel.bottomAnchor, constant: 8).isActive = true
        diveDatePicker.heightAnchor.constraint(equalToConstant: 54).isActive = true
        diveDatePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        diveDatePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        // Depth constraints
        diveDepthLabel.translatesAutoresizingMaskIntoConstraints = false
        diveDepthLabel.topAnchor.constraint(equalTo: diveDatePicker.bottomAnchor, constant: 18).isActive = true
        diveDepthLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        diveDepthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 24).isActive = true
        diveDepthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        
        minDepthLabel.translatesAutoresizingMaskIntoConstraints = false
        minDepthLabel.topAnchor.constraint(equalTo: diveDepthLabel.bottomAnchor, constant: 8).isActive = true
        minDepthLabel.heightAnchor.constraint(equalToConstant: 54).isActive = true
        minDepthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        minDepthLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        maxDepthLabel.translatesAutoresizingMaskIntoConstraints = false
        maxDepthLabel.topAnchor.constraint(equalTo: diveDepthLabel.bottomAnchor, constant: 8).isActive = true
        maxDepthLabel.heightAnchor.constraint(equalToConstant: 54).isActive = true
        maxDepthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        maxDepthLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        diveDepthSlider.translatesAutoresizingMaskIntoConstraints = false
        diveDepthSlider.topAnchor.constraint(equalTo: diveDepthLabel.bottomAnchor, constant: 8).isActive = true
        diveDepthSlider.heightAnchor.constraint(equalToConstant: 54).isActive = true
        diveDepthSlider.leadingAnchor.constraint(equalTo: minDepthLabel.trailingAnchor, constant: 12).isActive = true
        diveDepthSlider.trailingAnchor.constraint(equalTo: maxDepthLabel.leadingAnchor, constant: -12).isActive = true
        
        // Location constraints
        diveLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        diveLocationLabel.topAnchor.constraint(equalTo: minDepthLabel.bottomAnchor, constant: 18).isActive = true
        diveLocationLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        diveLocationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        diveLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.topAnchor.constraint(equalTo: diveLocationLabel.bottomAnchor, constant: 8).isActive = true
        locationTextField.heightAnchor.constraint(equalToConstant: 54).isActive = true
        locationTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        locationTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        // Entry Type constraints
        entryTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        entryTypeLabel.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 18).isActive = true
        entryTypeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        entryTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        entryTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        entryTypeControl.translatesAutoresizingMaskIntoConstraints = false
        entryTypeControl.topAnchor.constraint(equalTo: entryTypeLabel.bottomAnchor, constant: 8).isActive = true
        entryTypeControl.heightAnchor.constraint(equalToConstant: 54).isActive = true
        entryTypeControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        entryTypeControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        // Water Type constraints
        waterTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        waterTypeLabel.topAnchor.constraint(equalTo: entryTypeControl.bottomAnchor, constant: 18).isActive = true
        waterTypeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        waterTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        waterTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        waterTypeControl.translatesAutoresizingMaskIntoConstraints = false
        waterTypeControl.topAnchor.constraint(equalTo: waterTypeLabel.bottomAnchor, constant: 8).isActive = true
        waterTypeControl.heightAnchor.constraint(equalToConstant: 54).isActive = true
        waterTypeControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        waterTypeControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true

        // Duration constraints
        startTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        startTimeLabel.topAnchor.constraint(equalTo: waterTypeControl.bottomAnchor, constant: 12).isActive = true
        startTimeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        startTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        startTimeLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        startTimePicker.translatesAutoresizingMaskIntoConstraints = false
        startTimePicker.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 8).isActive = true
        startTimePicker.heightAnchor.constraint(equalToConstant: 54).isActive = true
        startTimePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        startTimePicker.widthAnchor.constraint(equalToConstant: 160).isActive = true

        endTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        endTimeLabel.topAnchor.constraint(equalTo: waterTypeControl.bottomAnchor, constant: 12).isActive = true
        endTimeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        endTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        endTimeLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        endTimePicker.translatesAutoresizingMaskIntoConstraints = false
        endTimePicker.topAnchor.constraint(equalTo: endTimeLabel.bottomAnchor, constant: 8).isActive = true
        endTimePicker.heightAnchor.constraint(equalToConstant: 54).isActive = true
        endTimePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        endTimePicker.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        // Notes constraints
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        notesLabel.topAnchor.constraint(equalTo: startTimePicker.bottomAnchor, constant: 12).isActive = true
        notesLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        notesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        notesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        notesTextView.translatesAutoresizingMaskIntoConstraints = false
        notesTextView.topAnchor.constraint(equalTo: notesLabel.bottomAnchor, constant: 8).isActive = true
        notesTextView.heightAnchor.constraint(equalToConstant: 96).isActive = true
        notesTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        notesTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        // Buddies constraints
        buddiesLabel.translatesAutoresizingMaskIntoConstraints = false
        buddiesLabel.topAnchor.constraint(equalTo: notesTextView.bottomAnchor, constant: 12).isActive = true
        buddiesLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        buddiesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        buddiesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        buddiesTextField.translatesAutoresizingMaskIntoConstraints = false
        buddiesTextField.topAnchor.constraint(equalTo: buddiesLabel.bottomAnchor, constant: 8).isActive = true
        buddiesTextField.heightAnchor.constraint(equalToConstant: 54).isActive = true
        buddiesTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        buddiesTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
        textfield.keyboardType = .numberPad
        return textfield
    }()

    let diveDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Dive Date:"
        return label
    }()

    let diveDateButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17)
        button.layer.cornerRadius = 5
        return button
    }()
    
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
    
    let startTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "Start Time:"
        return label
    }()
    
    let startTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let endTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.text = "End Time:"
        return label
    }()
    
    let endTimeButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 17)
        button.layer.cornerRadius = 5
        return button
    }()
    
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
    
    let saveDiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save Dive", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = CGSize(width: 1.1, height: 1.1)
        button.layer.masksToBounds = false
        return button
    }()
    
    let toolbar: UIToolbar = {
        let bar = UIToolbar()
        let flexspace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))
        bar.setItems([flexspace, doneButton], animated: false)
        bar.sizeToFit()
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(diveNumberLabel)
        addSubview(diveNumberTextField)
        addSubview(diveDateLabel)
        addSubview(diveDateButton)
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
        addSubview(startTimeButton)
        addSubview(endTimeLabel)
        addSubview(endTimeButton)
        addSubview(notesLabel)
        addSubview(notesTextView)
        addSubview(buddiesLabel)
        addSubview(buddiesTextField)
        addSubview(saveDiveButton)
        
        installConstraints()
        
        diveNumberTextField.inputAccessoryView = toolbar
        notesTextView.inputAccessoryView = toolbar
        
        locationTextField.delegate = self
        buddiesTextField.delegate = self
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

        diveDateButton.translatesAutoresizingMaskIntoConstraints = false
        diveDateButton.topAnchor.constraint(equalTo: diveDateLabel.bottomAnchor, constant: 8).isActive = true
        diveDateButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        diveDateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        diveDateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        
        // Depth constraints
        diveDepthLabel.translatesAutoresizingMaskIntoConstraints = false
        diveDepthLabel.topAnchor.constraint(equalTo: diveDateButton.bottomAnchor, constant: 18).isActive = true
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
        
        startTimeButton.translatesAutoresizingMaskIntoConstraints = false
        startTimeButton.topAnchor.constraint(equalTo: startTimeLabel.bottomAnchor, constant: 8).isActive = true
        startTimeButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        startTimeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        startTimeButton.widthAnchor.constraint(equalToConstant: 160).isActive = true

        endTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        endTimeLabel.topAnchor.constraint(equalTo: waterTypeControl.bottomAnchor, constant: 12).isActive = true
        endTimeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        endTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        endTimeLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        endTimeButton.translatesAutoresizingMaskIntoConstraints = false
        endTimeButton.topAnchor.constraint(equalTo: endTimeLabel.bottomAnchor, constant: 8).isActive = true
        endTimeButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        endTimeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        endTimeButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        // Notes constraints
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        notesLabel.topAnchor.constraint(equalTo: startTimeButton.bottomAnchor, constant: 12).isActive = true
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
        
        // Save Dive Button constraints
        saveDiveButton.translatesAutoresizingMaskIntoConstraints = false
        saveDiveButton.topAnchor.constraint(equalTo: buddiesTextField.bottomAnchor, constant: 24).isActive = true
        saveDiveButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        saveDiveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        saveDiveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        endEditing(true)
    }
}

extension CreateLogView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        endEditing(true)
        return true
    }
}

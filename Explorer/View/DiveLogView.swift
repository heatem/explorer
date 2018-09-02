//
//  DiveLogView.swift
//  Explorer
//
//  Created by Heather Mason on 8/20/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit
import GoogleMaps

class DiveLogView: UIView {
    
    // Background ImageView
    let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ScreenshotGoogleMaps")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // "Buddies" label
    let buddiesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.text = "Buddies"
        return label
    }()
    
    // Buddies icons
    let buddyView: UIView = {
        let view = UIView()
        return view
    }()
    
    // "Duration" label
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.text = "DURATION"
        return label
    }()
    
    // Duration value label
    let durationValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Roboto-Black", size: 20)
        label.text = "43min"
        return label
    }()
    
    // "Depth" label
    let depthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.text = "DEPTH"
        return label
    }()
    
    // Depth value label
    let depthValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Roboto-Black", size: 20)
        label.text = "41ft"
        return label
    }()
    
    // User icon
    let iconImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "defaultUserIcon"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        return imageView
    }()
    
    // Username
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.text = "d2burke"
        return label
    }()
    
    // Timestamp
    let timestampLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.textAlignment = .right
        label.text = "Thursday, July 24, 2015 at 10:15am"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgImageView)
//        addSubview(mapView)
        addSubview(buddiesLabel)
        addSubview(buddyView)
        addSubview(durationLabel)
        addSubview(durationValueLabel)
        addSubview(depthLabel)
        addSubview(depthValueLabel)
        addSubview(iconImageView)
        addSubview(usernameLabel)
        addSubview(timestampLabel)
        
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
        bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        // TODO: MapView constraints to replace bgImageView
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        mapView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        mapView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
//        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        buddiesLabel.translatesAutoresizingMaskIntoConstraints = false
        buddiesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        buddiesLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        buddiesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        buddiesLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.5).isActive = true
        
        buddyView.translatesAutoresizingMaskIntoConstraints = false
        buddyView.topAnchor.constraint(equalTo: buddiesLabel.bottomAnchor, constant: 6).isActive = true
        buddyView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buddyView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        buddyView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        durationLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        durationValueLabel.translatesAutoresizingMaskIntoConstraints = false
        durationValueLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 6).isActive = true
        durationValueLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        durationValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        durationValueLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        depthLabel.translatesAutoresizingMaskIntoConstraints = false
        depthLabel.topAnchor.constraint(equalTo: durationValueLabel.bottomAnchor, constant: 24).isActive = true
        depthLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        depthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        depthLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        depthValueLabel.translatesAutoresizingMaskIntoConstraints = false
        depthValueLabel.topAnchor.constraint(equalTo: depthLabel.bottomAnchor, constant: 6).isActive = true
        depthValueLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        depthValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        depthValueLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
//        iconImageView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -24).isActive = true
        iconImageView.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: -24).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
//        usernameLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 4).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: 4).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 4).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.4).isActive = true
        
        timestampLabel.translatesAutoresizingMaskIntoConstraints = false
//        timestampLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 4).isActive = true
        timestampLabel.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: 4).isActive = true
        timestampLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        timestampLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        timestampLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
    }
}

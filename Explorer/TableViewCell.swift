//
//  TableViewCell.swift
//  Explorer
//
//  Created by Heather Mason on 8/10/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
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
        
        for n in 0...4 {
            let frame = CGRect(x: n * 15, y: 0, width: 30, height: 30)
            let buddyIconView = UIView(frame: frame)
            buddyIconView.layer.cornerRadius = 15
            buddyIconView.backgroundColor = .gray
            view.addSubview(buddyIconView)
        }
        
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
    let userIconLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Regular", size: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.layer.backgroundColor = UIColor.brown.cgColor
        label.layer.cornerRadius = 24
        label.text = "DB"
        return label
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

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bgImageView)
        contentView.addSubview(buddiesLabel)
        contentView.addSubview(buddyView)
        contentView.addSubview(durationLabel)
        contentView.addSubview(durationValueLabel)
        contentView.addSubview(depthLabel)
        contentView.addSubview(depthValueLabel)
        contentView.addSubview(userIconLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(timestampLabel)
        
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
        
        userIconLabel.translatesAutoresizingMaskIntoConstraints = false
        userIconLabel.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: -24).isActive = true
        userIconLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        userIconLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        userIconLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: 4).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: userIconLabel.trailingAnchor, constant: 4).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: 0.4).isActive = true
        
        timestampLabel.translatesAutoresizingMaskIntoConstraints = false
        timestampLabel.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: 4).isActive = true
        timestampLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        timestampLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        timestampLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
    }
}

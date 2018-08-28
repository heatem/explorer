//
//  TableViewCell.swift
//  Explorer
//
//  Created by Heather Mason on 8/10/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let diveLogView = DiveLogView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(diveLogView)
        installConstraints()
        
    }
    
    func configure(with viewModel: DiveLogViewModel) {
        diveLogView.durationValueLabel.text = viewModel.duration
        diveLogView.depthValueLabel.text = viewModel.depth
        diveLogView.timestampLabel.text = viewModel.date
        diveLogView.usernameLabel.text = viewModel.username
        
        if let url = viewModel.userIcon {
            diveLogView.iconImageView.af_setImage(withURL: url)
        }
        
        if let buddies = viewModel.buddyIcons {
            for (n, buddyIcon) in buddies.enumerated() {
                let frame = CGRect(x: n * 15, y: 0, width: 30, height: 30)
                let buddyIconView = UIImageView(frame: frame)
                buddyIconView.layer.cornerRadius = 15
                buddyIconView.clipsToBounds = true
                buddyIconView.contentMode = .scaleAspectFill
                buddyIconView.backgroundColor = .gray
                if let url = buddyIcon {
                    buddyIconView.af_setImage(withURL: url)
                } else {
                    buddyIconView.image = #imageLiteral(resourceName: "defaultUserIcon")
                }
                diveLogView.buddyView.addSubview(buddyIconView)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        for view in diveLogView.buddyView.subviews {
            view.removeFromSuperview()
        }
        
        diveLogView.iconImageView.image = #imageLiteral(resourceName: "defaultUserIcon")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        diveLogView.translatesAutoresizingMaskIntoConstraints = false
        diveLogView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        diveLogView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        diveLogView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        diveLogView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

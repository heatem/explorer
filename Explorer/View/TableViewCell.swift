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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
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

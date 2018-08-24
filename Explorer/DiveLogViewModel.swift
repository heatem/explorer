//
//  diveLogViewModel.swift
//  Explorer
//
//  Created by Heather Mason on 8/14/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import Foundation

struct DiveLogViewModel {
    let date: String
    let depth: String
    let duration: String
    let userFullName: String
    let username: String
    let userIcon: String
    
    init(diveLog: DiveLog){
        
        // create dateformatter
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, MMMM d, yyyy"
        timeFormatter.dateFormat = "h:m a"
        
        self.date = "\(dateFormatter.string(from: diveLog.date)) at \(timeFormatter.string(from: diveLog.date))"
        self.depth = "\(String(diveLog.depth)) ft"
        self.duration = "\(String(Int(diveLog.timeOut.timeIntervalSince(diveLog.timeIn) / 60))) min"
        self.userFullName = diveLog.userFullName
        self.username = diveLog.username
        self.userIcon = diveLog.userIcon
    }
}

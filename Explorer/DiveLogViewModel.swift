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
    let depth: Int
    let duration: Int
    let userFullName: String
    let userID: String
    let userIcon: String
    
    init(diveLog: DiveLog){
        
        // create dateformatter
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        timeFormatter.dateFormat = "h:m a"
        
        self.date = dateFormatter.string(from: diveLog.date) + " at " + timeFormatter.string(from: diveLog.date)
        self.depth = diveLog.depth
        self.duration = Int(diveLog.timeOut.timeIntervalSince(diveLog.timeIn))
        self.userFullName = diveLog.userFullName
        self.userID = diveLog.userID
        self.userIcon = diveLog.userID
    }
}

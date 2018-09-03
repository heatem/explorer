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
    let mapImageUrl: URL?
    let userIcon: URL?
    var buddyIcons: [URL?]?
    
    init(diveLog: DiveLog){
        
        // create dateformatter
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, MMMM d, yyyy"
        timeFormatter.dateFormat = "h:m a"
        
        self.date = "\(dateFormatter.string(from: diveLog.date)) at \(timeFormatter.string(from: diveLog.date))"
        self.depth = "\(String(diveLog.depth)) ft"
        self.duration = "\(String(Int(diveLog.timeOut.timeIntervalSince(diveLog.timeIn) / 60))) min"
        self.userFullName = diveLog.user.fullName
        self.username = diveLog.user.username
        
        let mapUrl = URL(string: "https://maps.googleapis.com/maps/api/staticmap?center=\(diveLog.location.lat),\(diveLog.location.lon)&zoom=14&size=500x300&maptype=roadmap&markers=color:red%7Clabel:%7C\(diveLog.location.lat),\(diveLog.location.lon)")
        if let validMapUrl = mapUrl {
            self.mapImageUrl = validMapUrl
        } else {
            self.mapImageUrl = nil
        }
        
        if let validUserIcon = diveLog.user.icon {
            self.userIcon = URL(string: validUserIcon)
        } else {
            self.userIcon = nil
        }
        
        if diveLog.buddies != nil {
            var buddyIconUrls = [URL?]()
            for buddy in diveLog.buddies! {
                buddyIconUrls.append(URL(string: buddy.icon ?? ""))
            }
            self.buddyIcons = buddyIconUrls
        } else {
            self.buddyIcons = nil
        }
    }
}

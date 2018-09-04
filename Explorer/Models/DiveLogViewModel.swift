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
    var mapImageUrl: URL?
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
        
        defer {
            if let validMapUrl = mapUrl(for: diveLog.location) {
                self.mapImageUrl = validMapUrl
            } else {
                self.mapImageUrl = nil
            }
        }
    }
}

extension DiveLogViewModel {
    func mapUrl(for location: Location) -> URL? {
        let baseUrl = "https://maps.googleapis.com/maps/api"
        let zoom = "14&size=500x300"
        let center = "\(location.lat),\(location.lon)"
        let marker = "color:red%7Clabel:%7C\(center)"
        return URL(string: "\(baseUrl)/staticmap?center=\(center)&zoom=\(zoom)&maptype=roadmap&markers=\(marker)")
    }
}

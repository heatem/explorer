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
        
        var mapString = "https://maps.googleapis.com/maps/api/staticmap?center=&Brooklyn+Bridge,New+York,NY&zoom=6&size=600x300&maptype=landscape.natural&key=\(GOOGLE_API_KEY)"
        mapString = mapString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        //        "http://maps.google.com/maps/api/staticmap?center=36.949951,-77.7666379%@&sensor=true%@"
        
//        https://maps.googleapis.com/maps/api/staticmap?center=&zoom=6&size=600x300&maptype=landscape&key=\(GOOGLE_API_KEY)"
        self.mapImageUrl = URL(string: mapString)
        
//        NSString *staticMapUrl = [NSString stringWithFormat:@"http://maps.google.com/maps/api/staticmap?center=%@&sensor=true%@", [recentSearch objectForKey:@"searchTerm"],@"zoom=5&size=640x200"];

        
//            self.mapImageUrl = mapUrl
//        } else {
//            self.mapImageUrl = nil
//        }
        
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

//
//  diveLogModel.swift
//  Explorer
//
//  Created by Heather Mason on 8/13/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import Foundation

enum EntryType {
    case shore
    case boat
}

enum WaterType {
    case fresh
    case salt
}

struct DiveLog {
    let diveNumber: Int
    let date: Date
    let depth: Int
    let location: String
    let entryType: EntryType
    let waterType: WaterType
    let timeIn: Date
    let timeOut: Date
    let notes: String?
    
    // TODO: Move to `User` model
    let userFullName: String
    let userID: String
    let userIcon: String
}

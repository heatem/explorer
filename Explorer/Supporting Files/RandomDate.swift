//
//  DiveLogsMockData.swift
//  Explorer
//
//  Created by Heather Mason on 8/13/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import Foundation

func getRandomDate() -> Date? {
    let dayOffset = arc4random_uniform(365)
    let hourOffset = arc4random_uniform(24)
    let minuteOffset = arc4random_uniform(59)
    
    let now = Date(timeIntervalSinceNow: 0)
    let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    var offsetComponents = DateComponents()
    offsetComponents.day = -(Int(dayOffset))
    offsetComponents.hour = Int(hourOffset)
    offsetComponents.minute = Int(minuteOffset)
    
    let randomDate = gregorian?.date(byAdding: offsetComponents, to: now, options: .init(rawValue: 0) )
    return randomDate
}

func getRandomOffset(date: Date) -> Date? {
    let minuteOffset = arc4random_uniform(59)
    
    let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    var offsetComponents = DateComponents()
    offsetComponents.minute = Int(minuteOffset)
    
    let randomDate = gregorian?.date(byAdding: offsetComponents, to: date, options: .init(rawValue: 0) )
    return randomDate
}

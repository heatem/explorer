//
//  ExplorerTests.swift
//  ExplorerTests
//
//  Created by Heather Mason on 8/10/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import XCTest
@testable import Explorer

class ExplorerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitDiveLogViewModel() {
        let times = datesSeparated(by: 1800)
        
        let diveLog = DiveLog(
            diveNumber: 1,
            date: times.0,
            depth: 12,
            location: "North Shore, HI",
            entryType: .boat,
            waterType: .salt,
            timeIn: times.0,
            timeOut: times.1,
            notes: "This is a test",
            userFullName: "H Mason",
            userID: "hm",
            userIcon: "HM")
        
        let diveLogViewModel = DiveLogViewModel(diveLog: diveLog)
        
        XCTAssertEqual(diveLogViewModel.date, "Tuesday, February 28, 2017 at 1:38 PM")
        XCTAssertEqual(diveLogViewModel.duration, 30)
    }
    
    func datesSeparated(by duration: Double) -> (Date, Date) {
        var dateComponents = DateComponents()
        dateComponents.year = 2017
        dateComponents.month = 02
        dateComponents.day = 28
        dateComponents.timeZone = TimeZone(abbreviation: "PST")
        dateComponents.hour = 13
        dateComponents.minute = 38
        
        let userCalendar = Calendar.current
        let timeIn = userCalendar.date(from: dateComponents)!
        let timeOut = timeIn.addingTimeInterval(duration)
        
        return (timeIn, timeOut)
    }
}

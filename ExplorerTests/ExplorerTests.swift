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
    
    func testInitDiveLogViewModel_WithNilImage() {
        let times = datesSeparated(by: 1800)
        
        let diveLog = DiveLog(
            diveNumber: 1,
            date: times.0,
            depth: 12,
            location: Location(name: "Titanic", lat: 41.7325, lon: -49.946944),
            entryType: .boat,
            waterType: .salt,
            timeIn: times.0,
            timeOut: times.1,
            notes: "This is a test",
            user: User(
                fullName: "Eli Mason",
                username: "elim",
                icon: nil
            ),
            buddies: nil
        )
        
        let diveLogViewModel = DiveLogViewModel(diveLog: diveLog)
        
        XCTAssertEqual(diveLogViewModel.date, "Tue, February 28, 2017 at 1:38 PM")
        XCTAssertEqual(diveLogViewModel.duration, "30 min")
        XCTAssertEqual(diveLogViewModel.depth, "12 ft")
        XCTAssertEqual(diveLogViewModel.userFullName, "Eli Mason")
        XCTAssertEqual(diveLogViewModel.username, "elim")
        XCTAssertEqual(diveLogViewModel.userIcon, nil)
    }
    
    func testInitDiveLogViewModel_WithValidIconURL() {
        let times = datesSeparated(by: 1800)
        
        let diveLog = DiveLog(
            diveNumber: 1,
            date: times.0,
            depth: 12,
            location: Location(name: "North Shore, HI", lat: 21.587356, lon: -158.1421087),
            entryType: .boat,
            waterType: .salt,
            timeIn: times.0,
            timeOut: times.1,
            notes: "This is a test",
            user: User(
                fullName: "Sylvia Earle",
                username: "sylle",
                icon: "https://fournews-assets-prod-s3-ew1-nmprod.s3.amazonaws.com/media/2017/12/4ON_EARLE_PAB_0312_TempThumbnail1920x1080.jpg"
            ),
            buddies: nil
        )
        
        let diveLogViewModel = DiveLogViewModel(diveLog: diveLog)
        
        XCTAssertEqual(diveLogViewModel.date, "Tue, February 28, 2017 at 1:38 PM")
        XCTAssertEqual(diveLogViewModel.duration, "30 min")
        XCTAssertEqual(diveLogViewModel.depth, "12 ft")
        XCTAssertEqual(diveLogViewModel.userFullName, "Sylvia Earle")
        XCTAssertEqual(diveLogViewModel.username, "sylle")
        XCTAssertEqual(diveLogViewModel.userIcon, URL(string: "https://fournews-assets-prod-s3-ew1-nmprod.s3.amazonaws.com/media/2017/12/4ON_EARLE_PAB_0312_TempThumbnail1920x1080.jpg"))
    }
    
    func testInitDiveLogViewModel_WithBuddies() {
        let times = datesSeparated(by: 1800)
        let diveLog = DiveLog(
            diveNumber: 1,
            date: times.0,
            depth: 14,
            location: "Great Barrier Reef",
            entryType: .boat,
            waterType: .salt,
            timeIn: times.0,
            timeOut: times.1,
            notes: nil,
            user: User(
                fullName: "Jacques Cousteau",
                username: "jacques",
                icon: "https://2016franceblog.files.wordpress.com/2016/10/cousteau.jpg"
            ),
            buddies: [
                User(
                    fullName: "Ocean Ramsey",
                    username: "oramsey",
                    icon: "http://www.wholelifetimes.com/wp-content/uploads/OceanRamsey-194x240.jpg"
                ),
                User(
                    fullName: "Victor Berge",
                    username: "vberge",
                    icon: "https://thumbs.worthpoint.com/zoom/images1/1/0113/09/original-wwii-usa-navy-victor-berge_1_ead28c39bfc74ebfb688c7af5f68a042.jpg"
                )
            ]
        )
        
        let diveLogViewModel = DiveLogViewModel(diveLog: diveLog)
        
        XCTAssertEqual(diveLogViewModel.date, "Tue, February 28, 2017 at 1:38 PM")
        XCTAssertEqual(diveLogViewModel.duration, "30 min")
        XCTAssertEqual(diveLogViewModel.depth, "14 ft")
        XCTAssertEqual(diveLogViewModel.userFullName, "Jacques Cousteau")
        XCTAssertEqual(diveLogViewModel.username, "jacques")
        XCTAssertEqual(diveLogViewModel.userIcon, URL(string: "https://2016franceblog.files.wordpress.com/2016/10/cousteau.jpg"))
        XCTAssertEqual(diveLogViewModel.buddyIcons, [URL(string: "http://www.wholelifetimes.com/wp-content/uploads/OceanRamsey-194x240.jpg")!, URL(string: "https://thumbs.worthpoint.com/zoom/images1/1/0113/09/original-wwii-usa-navy-victor-berge_1_ead28c39bfc74ebfb688c7af5f68a042.jpg")!])
    }
    
    func testInitDiveLogViewModel_WithBuddiesWithoutIcon() {
        let times = datesSeparated(by: 1800)
        let diveLog = DiveLog(
            diveNumber: 1,
            date: times.0,
            depth: 14,
            location: "Great Barrier Reef",
            entryType: .boat,
            waterType: .salt,
            timeIn: times.0,
            timeOut: times.1,
            notes: nil,
            user: User(
                fullName: "Jacques Cousteau",
                username: "jacques",
                icon: "https://2016franceblog.files.wordpress.com/2016/10/cousteau.jpg"
            ),
            buddies: [
                User(
                    fullName: "Ocean Ramsey",
                    username: "oramsey",
                    icon: nil
                ),
                User(
                    fullName: "Victor Berge",
                    username: "vberge",
                    icon: nil
                )
            ]
        )
        
        let diveLogViewModel = DiveLogViewModel(diveLog: diveLog)
        
        XCTAssertEqual(diveLogViewModel.date, "Tue, February 28, 2017 at 1:38 PM")
        XCTAssertEqual(diveLogViewModel.duration, "30 min")
        XCTAssertEqual(diveLogViewModel.depth, "14 ft")
        XCTAssertEqual(diveLogViewModel.userFullName, "Jacques Cousteau")
        XCTAssertEqual(diveLogViewModel.username, "jacques")
        XCTAssertEqual(diveLogViewModel.userIcon, URL(string: "https://2016franceblog.files.wordpress.com/2016/10/cousteau.jpg"))
        XCTAssertEqual(diveLogViewModel.buddyIcons, [nil, nil])
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

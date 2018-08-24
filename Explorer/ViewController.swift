//
//  ViewController.swift
//  Explorer
//
//  Created by Heather Mason on 8/10/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var diveLogs = [DiveLog]()
    
    lazy var logTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Explorer"
        self.navigationController?.navigationBar.isTranslucent = false
        view.addSubview(logTableView)
        installConstraints()
        generateDiveLogs()
        let diveLogsView = viewModelsFrom(dataModels: diveLogs)
        print(diveLogsView)
    }

    func installConstraints() {
        logTableView.translatesAutoresizingMaskIntoConstraints = false
        logTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        logTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        logTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func generateDiveLogs() {
        for n in 1...21 {
            let date = getRandomDate()
            let offset = getRandomOffset(date: date!)
            let location = ["St. Croix", "Miami", "Phoenix Lake", "Kerr Lake", "Great Barrier Reef", "Burmuda Triangle"]
            let notes = ["", "a short note", "a pretty long note describing the dive and something notable about it. Maybe there was a shark. Maybe there was a turtle with a straw in it's nose?"]
            let entry = [EntryType.boat, EntryType.shore]
            let water = [WaterType.fresh, WaterType.salt]
            
            diveLogs.append(DiveLog(diveNumber: n, date: date!, depth: Int(arc4random_uniform(100)), location: location[Int(arc4random_uniform(UInt32(location.count)))], entryType: entry[Int(arc4random_uniform(UInt32(entry.count)))], waterType: water[Int(arc4random_uniform(UInt32(water.count)))], timeIn: date!, timeOut: offset!, notes: notes[Int(arc4random_uniform(UInt32(notes.count)))], userFullName: "D Burke", username: "dburke", userIcon: "DB"))
        }
    }
    
    func viewModelsFrom(dataModels: [DiveLog]) -> [DiveLogViewModel] {
        var diveLogsView = [DiveLogViewModel]()
        for diveLog in diveLogs {
            let viewModel = DiveLogViewModel(diveLog: diveLog)
            diveLogsView.append(viewModel)
        }
        return diveLogsView
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diveLogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let diveLogForRowAtIndexPath = DiveLogViewModel(diveLog: diveLogs[indexPath.row])
        
        cell.diveLogView.durationValueLabel.text = diveLogForRowAtIndexPath.duration
        cell.diveLogView.depthValueLabel.text = diveLogForRowAtIndexPath.depth
        cell.diveLogView.timestampLabel.text = diveLogForRowAtIndexPath.date
        cell.diveLogView.usernameLabel.text = diveLogForRowAtIndexPath.username
        cell.diveLogView.userIconLabel.text = diveLogForRowAtIndexPath.userIcon
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}


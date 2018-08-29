//
//  ViewController.swift
//  Explorer
//
//  Created by Heather Mason on 8/10/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

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
            let user = User(fullName: "Sylvia Earle", username: "sylle", icon: "https://fournews-assets-prod-s3-ew1-nmprod.s3.amazonaws.com/media/2017/12/4ON_EARLE_PAB_0312_TempThumbnail1920x1080.jpg")
            
            diveLogs.append(DiveLog(
                diveNumber: n, date: date!, depth: Int(arc4random_uniform(100)), location: location[Int(arc4random_uniform(UInt32(location.count)))], entryType: entry[Int(arc4random_uniform(UInt32(entry.count)))], waterType: water[Int(arc4random_uniform(UInt32(water.count)))], timeIn: date!, timeOut: offset!, notes: notes[Int(arc4random_uniform(UInt32(notes.count)))], user: user, buddies: [User(fullName: "Ocean Ramsey", username: "oramsey", icon: "https://xcelwetsuits.eu/wp-content/uploads/2018/04/ocean-ramsey-wears-dolphin-uv-shirt.jpg"), User(fullName: "Victor Berge", username: "vberge", icon: "https://thumbs.worthpoint.com/zoom/images1/1/0113/09/original-wwii-usa-navy-victor-berge_1_ead28c39bfc74ebfb688c7af5f68a042.jpg"), User(fullName: "Jacques Cousteau", username: "jaco", icon: nil)]))
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
        let viewModel = DiveLogViewModel(diveLog: diveLogs[indexPath.row])
        
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}


//
//  ViewController.swift
//  Explorer
//
//  Created by Heather Mason on 8/10/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    }

    func installConstraints() {
        logTableView.translatesAutoresizingMaskIntoConstraints = false
        logTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        logTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        logTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}


//
//  CreateLogViewController.swift
//  Explorer
//
//  Created by Heather Mason on 9/4/18.
//  Copyright © 2018 Heather Mason. All rights reserved.
//

import Foundation
import UIKit

class CreateLogViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize.height = 1200
        view.backgroundColor = .lightGray
        return view
    }()
    
    let createLogView = CreateLogView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(createLogView)
        view.addSubview(scrollView)
        
        installConstraints()
    }
    
    func installConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        createLogView.translatesAutoresizingMaskIntoConstraints = false
        createLogView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        createLogView.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        createLogView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        createLogView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
}

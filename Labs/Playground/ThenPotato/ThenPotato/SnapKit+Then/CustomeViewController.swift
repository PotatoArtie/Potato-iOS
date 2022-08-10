//
//  CustomeViewController.swift
//  ThenPotato
//
//  Created by Atlas on 2022/02/04.
//

import UIKit

class CustomeViewController: UIViewController {
        
    var customView = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        self.view.addSubview(self.customView)
        self.customView.drawCustomUI()
    }
}


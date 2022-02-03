//
//  SnapKitViewController.swift
//  KeyboardHeightPotato
//
//  Created by Atlas on 2022/02/03.
//

import UIKit

class SnapKitViewController: UIViewController {
    var pinNuberView = PinNumberView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "created by using snapkit"
        self.view.addSubview(pinNuberView)
        self.pinNuberView.drawCustomUI()
        
    }
}

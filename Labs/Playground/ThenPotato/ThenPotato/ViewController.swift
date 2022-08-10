//
//  ViewController.swift
//  ThenPotato
//
//  Created by Atlas on 2022/02/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnPressed(_ sender: UIButton) {
        
        let customViewVC = CustomeViewController()
        self.navigationController?.pushViewController(customViewVC, animated: true)
    }
}


//
//  HomeViewController.swift
//  KeyboardHeightPotato
//
//  Created by Atlas on 2022/02/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func uikitSwiftPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ViewController")
        
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func uikitRxSwiftPressed(_ sender: UIButton) {
    }
    
    @IBAction func snapkitRxSwift(_ sender: UIButton) {
        let viewController = SnapKitViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


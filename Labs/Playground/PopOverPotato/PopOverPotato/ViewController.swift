//
//  ViewController.swift
//  PopOverPotato
//
//  Created by Atlas on 2022/02/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "popOverViewController")
        
        viewController.modalPresentationStyle = .popover
        
        self.present(viewController, animated: true, completion: nil)
        
    }
    
}


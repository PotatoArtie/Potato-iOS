//
//  ViewController.swift
//  UIKit+PreviewPotato
//
//  Created by Atlas on 2022/04/10.
//

import UIKit
import SwiftUI
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someLabel: UILabel = {
            let label = UILabel()
            label.text = "Preview ViewController"
            label.font = .systemFont(ofSize: 20)
            label.textAlignment = .left
            return label
        }()
        
        self.view.addSubview(someLabel)
        
        someLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


#if canImport(SwiftUI) && DEBUG
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController().preview()
    }
}
#endif

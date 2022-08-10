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
    let someLabel: UILabel = {
        let label = UILabel()
        label.text = "Preview ViewController"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let someView = SomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(someLabel)
        self.view.addSubview(someView)
        
        someLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(30)
        }
        
        someView.snp.makeConstraints {
            $0.top.equalTo(self.someLabel).offset(30)
            $0.leading.trailing.equalTo(self.someLabel)
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

//
//  SomeView.swift
//  UIKit+PreviewPotato
//
//  Created by Atlas on 2022/04/10.
//

import UIKit
import SwiftUI
import SnapKit

class SomeView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawCustomUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    func drawCustomUI(){
        let someLabel: UILabel = {
            let label = UILabel()
            label.text = "Preview View Unit"
            label.font = .systemFont(ofSize: 20)
            label.textAlignment = .left
            return label
        }()
        
        self.addSubview(someLabel)
        
        someLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

struct SomeViewPreview: PreviewProvider {
    static var previews: some View {
        SomeView().preview()
    }
}

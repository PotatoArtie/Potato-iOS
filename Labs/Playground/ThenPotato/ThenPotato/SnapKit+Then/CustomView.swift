//
//  CustomView.swift
//  ThenPotato
//
//  Created by Atlas on 2022/02/04.
//

import SnapKit
import UIKit
import Then

class CustomView: UIView {
    /*
    var someLabel2: UILabel = UILabel().then { lbl in
        lbl.text = "Then Potato"
        lbl.textAlignment = .center
        lbl.textColor = .green
    }
    
    var someLabel2 = UILabel().then { lbl in
        lbl.text = "Then Potato"
        lbl.textAlignment = .center
        lbl.textColor = .green
    }
    */
    var someLabel2 = UILabel().then {
        $0.text = "Then Potato"
        $0.textAlignment = .center
        $0.textColor = .green
    }
    
    var someLabel:UILabel = {
            var nameLbl = UILabel()
            nameLbl.text = "Then Potato"
            nameLbl.textAlignment = .center
            nameLbl.textColor = .blue
            return nameLbl
    }()
    
    let nameLbl2 = UILabel().then {
        $0.text = "Atlas"
        $0.textAlignment = .center
        $0.textColor  = .green
    }
    
    func drawCustomUI(){
        self.addSubview(someLabel)
        self.addSubview(someLabel2)
        
        self.backgroundColor = .white
        
        self.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        
        
        someLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        someLabel2.snp.makeConstraints {
            $0.top.equalTo(someLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
    }
    
}

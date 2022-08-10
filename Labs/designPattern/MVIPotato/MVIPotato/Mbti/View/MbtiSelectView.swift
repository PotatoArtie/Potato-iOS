//
//  MbtiSelectView.swift
//  MVIPotato
//
//  Created by Atlas on 2022/07/27.
//

import UIKit
import SnapKit
import Then

class MbtiSelectView: UIView {

    var titleLabel = UILabel().then {
        $0.text = "Choose your MBTI"
        $0.font = .systemFont(ofSize: 30)
        $0.textAlignment = .center
    }
    
    var leftButton = UIButton(type: .custom).then {
        $0.setTitle("left", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderColor = UIColor.yellow.cgColor
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
    }
    
    var rightButton = UIButton(type: .custom).then {
        $0.setTitle("right", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 6
        $0.layer.borderColor = UIColor.yellow.cgColor
        $0.layer.borderWidth = 1
    }
    
    var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.spacing = 10
    }

}


extension MbtiSelectView {
    func drawUI(superView: UIView){
        print("superview \(superView.frame.size)")
        self.addSubview(self.titleLabel)
        self.addSubview(self.buttonStackView)
        
        self.buttonStackView.addArrangedSubview(self.leftButton)
        self.buttonStackView.addArrangedSubview(self.rightButton)
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        self.buttonStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(superView.frame.size.width/2)
        }
    }
    
    func leftButtonSelected(isSelected: Bool){
        let borderColor: UIColor = isSelected ? .red : .yellow
        self.leftButton.layer.borderColor = borderColor.cgColor
    }
    
    func rightButtonSelected(isSelected: Bool){
        let borderColor: UIColor = isSelected ? .red : .yellow
        self.rightButton.layer.borderColor = borderColor.cgColor
    }
}

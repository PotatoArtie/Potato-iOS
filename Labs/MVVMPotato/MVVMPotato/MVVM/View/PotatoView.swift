//
//  PotatoView.swift
//  MVVMPotato
//
//  Created by Atlas on 2022/03/01.
//

import UIKit
import SnapKit
import Then

protocol CustomDelegate{
    func buttonPressed()
}

class PotatoView: UIView {
    
    let titleLabel = UILabel().then {
        $0.text = "맛있는 감자를 골라보세요."
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    let productlabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    let searchButton = UIButton(type: .custom).then {
        $0.setTitle("감자보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .lightGray
        $0.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
    }
    
    var delegate: CustomDelegate?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawCustomUI()
    }
    
    @available(*,unavailable)
    required init?(coder decoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    func drawCustomUI(){
        self.addSubview(titleLabel)
        self.addSubview(productlabel)
        self.addSubview(searchButton)
        
        self.titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        self.productlabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(50)
        }
        
        self.searchButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets.bottom).inset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
    }
    
    func updatePotatoText(info: String){
        self.productlabel.text = info
    }
    
    @objc
    func btnPressed(){
        self.delegate?.buttonPressed()
    }
}

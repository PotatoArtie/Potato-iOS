//
//  PinNumberView.swift
//  KeyboardHeightPotato
//
//  Created by Atlas on 2022/02/03.
//

import RxSwift
import RxCocoa
import SnapKit
import Then
import CoreGraphics
import UIKit

class PinNumberView: UIView {
    let disposeBag = DisposeBag()
    
    var titleLbl = UILabel().then {
        $0.text = "PIN NUMBER"
        $0.textAlignment = .center
    }
    
    var pinNumberTextField = UITextField().then {
        $0.placeholder = "by snapkit"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    var nextButton = UIButton().then {
        $0.setTitle("next", for: .normal)
        $0.backgroundColor = .darkGray
    }
    
    func drawCustomUI(){
        
        self.addSubview(self.titleLbl)
        self.addSubview(self.pinNumberTextField)
        self.addSubview(self.nextButton)
        
        self.backgroundColor = .white
        //* 'windows' was deprecated in iOS 15.0: Use UIWindowScene.windows on a relevant window scene instead
        let safeArea = UIApplication.shared.windows.first{$0.isKeyWindow}?.safeAreaInsets

        
        self.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }
        
        self.titleLbl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            $0.left.equalTo(safeAreaLayoutGuide.snp.left).offset(50)
            $0.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-50)
        }
        
        self.pinNumberTextField.snp.makeConstraints {
            $0.top.equalTo(self.titleLbl.snp.bottom).offset(20)
            $0.left.equalTo(safeAreaLayoutGuide.snp.left).offset(50)
            $0.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-50)
            $0.height.equalTo(50)
        }
        
        
        self.nextButton.rx.tap
            .subscribe(onNext: {
                self.pinNumberTextField.resignFirstResponder()
            })
        
        keyboardHeight()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { keyboardHeight in
                let safeAreaBottom = safeArea?.bottom ?? 0
                let height = keyboardHeight > 0.0 ? (keyboardHeight - safeAreaBottom) : safeAreaBottom
                self.updateNextBtnBottom(-height)
                
            })
            .disposed(by: disposeBag)
        
        self.pinNumberTextField.becomeFirstResponder()
    }
    
    func updateNextBtnBottom(_ offset: CGFloat){
        self.nextButton.snp.remakeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(offset)
            $0.left.equalTo(0)
            $0.right.equalTo(0)
            $0.height.equalTo(50)
        }
        
    }
}

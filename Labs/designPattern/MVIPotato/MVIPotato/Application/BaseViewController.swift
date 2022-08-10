//
//  BaseViewController.swift
//  MVIPotato
//
//  Created by Atlas on 2022/07/27.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class BaseViewController: UIViewController {

    var bottomButton = UIButton(type: .system).then {
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderColor = UIColor.black.cgColor
        $0.setTitle("다음", for: .normal)
        $0.backgroundColor = .gray
    }
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

}

extension BaseViewController {
    private func setupUI() {
        view.addSubview(bottomButton)
        
        bottomButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            $0.height.equalTo(52)
        }
    }
    
    func isBottomButtonEnabled(isEnabled: Bool){
        bottomButton.isEnabled = isEnabled
        bottomButton.backgroundColor = isEnabled ? .orange : .gray
        bottomButton.setTitle(isEnabled ? "완료" : "다음", for: .normal)
    }
}

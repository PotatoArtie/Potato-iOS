//
//  ViewController.swift
//  MVIPotato
//
//  Created by Atlas on 2022/07/27.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {

    private let mbtiSelectView = MbtiSelectView()
    private let intent = MbtiIntent()
    var alert: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.setupUI()
        
    }

}

extension ViewController {
    
    public func render(withState: MbtiState){
        switch withState {
        case is MbtiPresenting:
            let state = withState as! MbtiPresenting
            mbtiSelectView.leftButton.setTitle(state.mbti.left, for: .normal)
            mbtiSelectView.rightButton.setTitle(state.mbti.right, for: .normal)
            
            mbtiSelectView.leftButtonSelected(isSelected: false)
            mbtiSelectView.rightButtonSelected(isSelected: false)
            
            isBottomButtonEnabled(isEnabled: false)
        case is MbtiSelected:
            let state = withState as! MbtiSelected
            showAlert(state.result)
            isBottomButtonEnabled(isEnabled: true)
        default:
            break
        }
    }
    
}

extension ViewController {
    
    private func setup(){
        intent.bind(toView: self)
        self.bindButtons()
        
        alert = UIAlertController(title: "Your MBTI is",
                                          message: "",
                                          preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Confirm", style: .cancel) { _ in self.intent.confrimButtonPressed() }
        alert?.addAction(dismiss)
    }
    
    private func setupUI(){
        self.view.addSubview(self.mbtiSelectView)
        self.mbtiSelectView.drawUI(superView: self.view)
        self.mbtiSelectView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(bottomButton.snp.top)
        }
    }
    
    private func bindButtons(){
        
        mbtiSelectView.leftButton.rx.tap
            .bind{ [weak self] _ in
                UIView.animate(withDuration: 1.0, delay: 0, options: []
                ) {
                self?.mbtiSelectView.leftButtonSelected(isSelected: true)
                } completion: { _ in
                    self?.intent.leftButtonPressed()
                }

            }
            .disposed(by: disposeBag)
        
        
        mbtiSelectView.rightButton.rx.tap
            .bind{ [weak self] _ in
                UIView.animate(withDuration: 1.0, delay: 0, options: []
                ) {
                    self?.mbtiSelectView.rightButtonSelected(isSelected: true)
                } completion: { _ in
                    self?.intent.rightButtonPressed()
                }
            }
            .disposed(by: disposeBag)
        
        bottomButton.rx.tap
            .bind(onNext: self.intent.bottomButtonPressed)
            .disposed(by: disposeBag)
    }
    
    private func showAlert(_ name: String) {
        guard let alert = alert else { return }
        alert.message = name
        self.present(alert, animated: true, completion: nil)
    }
}

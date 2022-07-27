//
//  MbtiIntent.swift
//  MVIPotato
//
//  Created by Atlas on 2022/07/27.
//

import Foundation
import RxSwift
import RxCocoa

class MbtiIntent {
    
    var stateRelay: PublishRelay<MbtiState>
    var view: ViewController?
    let selector = MbtiSelector()
    
    var disposeBag = DisposeBag()
    
    init() {
        self.stateRelay = PublishRelay()
    }
    
    public func bind(toView: ViewController){
        self.view = toView
        
        self.stateRelay.subscribe{ event in
            guard let state = event.element else { return }
            self.view?.render(withState: state)
            
        }.disposed(by: self.disposeBag)
        let mbti = selector.currentMbti
    
        self.stateRelay.accept(MbtiPresenting(mbti: Mbti(left: mbti.left, right: mbti.right)))
    }
    
    private func updateView(_ mbti: Mbti){
        self.stateRelay.accept(MbtiPresenting(mbti: mbti))
    }
    
    private func selectedMBTI(_ result: String){
        self.stateRelay.accept(MbtiSelected(result: result))
    }
}

extension MbtiIntent {
    func leftButtonPressed(){
        
        guard let mbti = selector.mbtiPressed(selector.getLeftString()) else {
            self.selectedMBTI(selector.selectedString)
            return
        }
        
        self.updateView(mbti)
    }
    
    func rightButtonPressed(){
        
        guard let mbti = selector.mbtiPressed(selector.getRightString()) else {
            self.selectedMBTI(selector.selectedString)
            return
        }
        
        self.updateView(mbti)
    }
    
    func bottomButtonPressed(){
        
    }
    
    func confrimButtonPressed(){
        self.selector.reset()
        let mbti = selector.currentMbti
        self.stateRelay.accept(MbtiPresenting(mbti: Mbti(left: mbti.left, right: mbti.right)))
    }
}

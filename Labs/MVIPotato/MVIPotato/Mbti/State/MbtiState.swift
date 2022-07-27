//
//  MbtiState.swift
//  MVIPotato
//
//  Created by Atlas on 2022/07/27.
//

import Foundation

protocol MbtiState {}

class MbtiPresenting: MbtiState {
    let mbti: Mbti
    init(mbti: Mbti){
        self.mbti = mbti
    }
}

class MbtiSelected: MbtiState {
    let result: String
    
    init(result: String){
        self.result = result
    }
}

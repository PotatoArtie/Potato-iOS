//
//  Mbti.swift
//  MVIPotato
//
//  Created by Atlas on 2022/07/27.
//

import Foundation
import UIKit

struct Mbti {
    let left: String
    let right: String
    var selected: String?
}

class MbtiSelector {
    var mbties: [Mbti]
    var index: Int = 0
    var selected: [String]
    var selectedString: String {
        get {
            selected.map{$0}.joined(separator: "")
        }
    }
    
    var currentMbti: Mbti {
        return mbties[index]
    }
    
    init() {
        self.mbties = [
            Mbti(left: "E", right: "I"),
            Mbti(left: "S", right: "N"),
            Mbti(left: "T", right: "F"),
            Mbti(left: "J", right: "P")
        ]
        selected = [String]()
    }
    
    public func reset(){
        self.index = 0
        self.selected = [String]()
    }
    
    public func mbtiPressed(_ selected: String) -> Mbti? {
        self.selected.append(selected)
        
        if !isNextMbtiAvailalble() { return nil }
        self.index  = self.index + 1
        return self.mbties[self.index]
    }
    
    private func isNextMbtiAvailalble() -> Bool {
        return self.mbties.count - 1 > index
    }
    
    public func getLeftString() -> String {
        return self.mbties[index].left
    }
    
    public func getRightString() -> String {
        return self.mbties[index].right
    }
}

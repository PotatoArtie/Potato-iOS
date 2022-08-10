//
//  PotatoModel.swift
//  MVVMPotato
//
//  Created by Atlas on 2022/03/01.
//

import Foundation

//MARK: - 용도에 따라서 class 나 struct 사용하면 된다.
struct Potato {
    enum Size {
        case small
        case medium
        case large
    }

    var name: String
    var size: Size
    
}

extension Potato {
    static func getData() -> Potato {
        return Potato(name: "Yum-yum", size: .small)
    }
}

/*
class Potato {
    enum Size {
        case small
        case medium
        case large
    }
    
    var name: String
    var age: Int
    var size: Size
    
    init(name: String, size: Size){
        self.name = name
        self.age = age
        self.size = size
    }
}
*/

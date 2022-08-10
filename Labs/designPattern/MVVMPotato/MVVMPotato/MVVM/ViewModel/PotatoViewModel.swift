//
//  PotatoViewModel.swift
//  MVVMPotato
//
//  Created by Atlas on 2022/03/01.
//

import Foundation
import UIKit

class PotatoViewModel {
    private let potato: Potato
    
    init(potato: Potato) {
        self.potato = potato
    }
    
    var name: String {
        return self.potato.name
    }
    
    private func getPrice(size: Potato.Size) -> String{
        switch size {
        case .small:
            return "500원"
        case .medium:
            return "1500원"
        case .large:
            return "2000원"
        }
    }
    
    func getProductInfo() -> String{
        return "상품명: \(potato.name) 가격: \(getPrice(size: potato.size))"
    }
}

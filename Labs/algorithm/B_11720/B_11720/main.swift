//
//  main.swift
//  B_11720
//
//  Created by Dongju on 2022/07/18.
//

import Foundation

func solution(nums: String?) -> Int {
    guard let nums = nums else { return 0 }
    
    let numArr = nums.map{$0} // Array(nums)
    var sum = 0
    
    for item in numArr {
        sum = sum + (Int(String(item)) ?? 0) 
        //Cannot convert value of type 'String.Element' (aka 'Character') to expected argument type 'String'
    }
    
    return sum
}

func solution2(nums: String?) -> Int {
    guard let nums = nums else { return 0 }
    return  nums.reduce(0) { partialResult, value in
        guard let value = Int(String(value)) else { return partialResult}
        
        return partialResult + value
    }
}



let count = readLine()
let numbers = readLine()

print(solution(nums: numbers))
print(solution2(nums: numbers))


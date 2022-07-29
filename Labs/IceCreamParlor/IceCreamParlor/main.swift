//
//  main.swift
//  IceCreamParlor
//
//  Created by Atlas on 2022/07/30.
//

import Foundation

func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    var resultArray = [Int]()
    let tmpArray = arr.sorted()
    for item in tmpArray {
        var leftIndex = 0
        var rightIndex = tmpArray.count - 1
        while leftIndex <= rightIndex{
            let mid = (leftIndex + rightIndex) / 2
            let v = item + tmpArray[mid]
            if v  == m {
                resultArray.append(1 + arr.firstIndex(of:item)!)
                resultArray.append(1 + arr.lastIndex(of: tmpArray[mid])!)
                return resultArray.sorted()
            }else if m > v {
                leftIndex = mid + 1
            }else {
                rightIndex = mid - 1
            }
        }
    }
    return resultArray
}

let m = Int(readLine()!)!
let leftArray = readLine()?.split(separator: " ").compactMap{Int($0)}
print(icecreamParlor(m: m, arr: leftArray!))



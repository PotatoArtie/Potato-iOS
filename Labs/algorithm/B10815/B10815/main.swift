//
//  main.swift
//  B10815
//
//  Created by Atlas on 2022/07/25.
    
//

import Foundation

func soulution(_ sangunCards: [Int]?, _ mIntegers: [Int]?){
    var soulutionArrray = [Int]()
    mIntegers?.forEach({ mElement in
        var leftIndex = 0
        var rightIndex = sangunCards!.count-1
        var hasSameValue = false

        
        while leftIndex <= rightIndex {
            let midIndex = (leftIndex + rightIndex)/2
            if mElement > sangunCards![midIndex] {
                leftIndex = midIndex + 1
            }else if mElement == sangunCards![midIndex] {
                hasSameValue = true
                break
            }else{
                rightIndex = midIndex-1
            }
        }
        
          
        soulutionArrray.append(hasSameValue ? 1 : 0)
    })
    
    print(soulutionArrray)
}

//soulution(sangunCards, mIntegers)

let sangun = Int(readLine()!)!
let sangunCards = readLine()?.split(separator: " ").compactMap{Int($0)}.sorted()
let m = Int(readLine()!)!
let mIntegers = readLine()?.split(separator: " ").compactMap{Int($0)}

var soulutionArrray = [Int]()
mIntegers?.forEach({ mElement in
    var leftIndex = 0
    var rightIndex = sangunCards!.count-1
    var hasSameValue = false

    
    while leftIndex <= rightIndex {
        let midIndex = (leftIndex + rightIndex)/2
        if mElement > sangunCards![midIndex] {
            leftIndex = midIndex + 1
        }else if mElement == sangunCards![midIndex] {
            hasSameValue = true
            break
        }else{
            rightIndex = midIndex-1
        }
    }
    
    
    //way1
    soulutionArrray.append(hasSameValue ? 1 : 0)
    
    //way2
    //if hasSameValue {
    //    soulutionArrray.append(1)
    //}else{
    //    soulutionArrray.append(0)
    //}
})

print(soulutionArrray.map{String($0)}.joined(separator: " "))



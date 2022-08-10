//
//  main.swift
//  B7795
//
//  Created by Atlas on 2022/07/21.
//

import Foundation

func solution(testCase: Int){
    for _ in 0..<testCase {
        let arraySize = readLine()?.split(separator: " ").compactMap{Int($0)}
        guard let arraySize = arraySize else { return }
    
        var array = [[Int]]()
        for _ in 0..<arraySize.count {
            let temp2 = readLine()?.split(separator: " ").compactMap{Int($0)}
            array.append((temp2!.sorted(by: <))) // 이진탐색을 위한 정렬
        }
        
        getResult(array)
    }
}

func getResult(_ data: [[Int]]) {
    var count = 0
    
    data[0].forEach { str in
        let value = Int(str)
        var left = 0
        var right = data[1].count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            print("v :\(value) , left: \(left) ,right :\(right), mid\(mid) , midvalue \(data[1][mid])")
            if value > data[1][mid] {
                left = mid + 1
            }else{
                right = mid-1
            }
        }
        
        print("count ===== > \(left)")
        count += left
    }
    
    print("\(count)" )
}

let testCaseLength = readLine()!
print("\(solution(testCase: (Int(testCaseLength) ?? 0)))")


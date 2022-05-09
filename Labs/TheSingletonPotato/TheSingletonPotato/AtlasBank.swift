//
//  AtlasBank.swift
//  TheSingletonPotato
//
//  Created by Atlas on 2022/04/22.
//

import Foundation


//MARK: - Non Thread - safe
class AtlasBank {
    public static var shared = AtlasBank()

    var history: [String: Int] = [:]
    private init(){}

    public func deposit(user: String ,amount: Int ){

        history[user] = amount
    }

    public func checkBalance(user: String) -> Int{
        return history[user] ?? 0
    }
}

//MARK: - Thread - safe
class AtlasBankWithSerialQueue {
    var serialQueue = DispatchQueue(label: "atlasSerialQueue")
    public static var shared = AtlasBankWithSerialQueue()


    private var history: [String: Int] = [:]
    private init(){}

    public func deposit(user: String ,amount: Int ){
        serialQueue.sync (flags: .barrier){
            self.history[user] = amount
        }
    }

    public func checkBalance(user: String) -> Int?{
        var amount:Int?
        serialQueue.sync {
            amount = self.history[user]
        }
        return amount
    }
}


//MARK: - Thread - safe + Optimizing for speed
class AtlasBankWithBarrier {
    var concurrentQueue = DispatchQueue(label: "atlasConcurrentQueue",attributes: .concurrent)
    public static var shared = AtlasBankWithBarrier()
    
    private var history: [String: Int] = [:]
    private init(){}

    public func deposit(user: String ,amount: Int ){
        concurrentQueue.async (flags: .barrier){
            print("\(user) : \(amount)")
            self.history[user] = amount
        }

    }

    public func checkBalance(user: String) -> Int?{
        var amount:Int?
        concurrentQueue.sync {
            amount = self.history[user]
        }
        return amount
    }
}


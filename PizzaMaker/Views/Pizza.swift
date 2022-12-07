//
//  Pizza.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/5/22.
//

import SwiftUI

struct Pizza : Codable {
    var id : UUID
    var name : String
    var description : String
    var sPrice : Double
    var mPrice : Double
    var lPrice : Double
    var size : String = "S"
    var ingredients : [Ingredient] = []
    var count : Int = 0
    
    mutating func increment() {
        count += 1
    }
    
    mutating func decrement() {
        count -= 1
    }
    
    mutating func setCount(_ num : Int) {
        count = num
    }
    
    mutating func setSize(_ size : String) {
        self.size = size
    }
}

struct Ingredient : Codable {
    var name: String
    var count: Int
    mutating func increment() {
        count += 1
    }
    mutating func decrement() {
        if count != 0 {
            count -= 1
        }
    }
}

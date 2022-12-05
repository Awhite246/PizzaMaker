//
//  Pizza.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/5/22.
//

import SwiftUI

class Pizza : ObservableObject {
    private var name : String = ""
    private var description : String = ""
    private var price : Double = 0.0
    private var size : String = ""
    private var ingredients : [Ingredient] = []
    private var count : Int = 0
    func increment() {
        count += 1
    }
    func decrement() {
        count -= 1
    }
    func setCount(_ num : Int) {
        count = num
    }
    func setSize(_ size : String) {
        self.size = size
    }
    func addIngredient (_ ingredient : Ingredient) {
        
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
    func getName() -> String {
        return name
    }
}

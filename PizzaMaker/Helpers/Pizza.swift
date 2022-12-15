//
//  Pizza.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/5/22.
//

import SwiftUI

struct Pizza : Codable, Identifiable, Equatable {
    var id : UUID
    var name : String
    var sPrice : Double //pizza small price
    var mPrice : Double //pizza medium price
    var lPrice : Double //pizza large price
    var ingredients : [Ingredient]
    var description : String
    var trending : Bool
    var dailyDeal : Bool
    var count : Int //amount of pizzas ordered
    var size : String //size of the pizza
}

struct Ingredient : Codable, Identifiable, Equatable {
    var id: UUID
    var name: String
    var count: Int
}

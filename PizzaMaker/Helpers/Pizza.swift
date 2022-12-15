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
    var sPrice : Double
    var mPrice : Double
    var lPrice : Double
    var ingredients : [Ingredient]
    var description : String
    var trending : Bool
    var dailyDeal : Bool
    var count : Int
    var size : String
}

struct Ingredient : Codable, Identifiable, Equatable {
    var id: UUID
    var name: String
    var count: Int
}

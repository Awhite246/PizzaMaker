//
//  OrderList.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/15/22.
//

import SwiftUI

class OrderList : ObservableObject {
    @Published var items = [Pizza]()
    
    func add(item : Pizza, size : String, amount : Int = 1) {
        for i in 0..<items.count {
            if items[i].name == item.name && (items[i].size == size) {
                items[i].count += amount
                return
            }
        }
        let newPizza = Pizza(id: UUID(), name: item.name, sPrice: item.sPrice, mPrice: item.mPrice, lPrice: item.lPrice, ingredients: item.ingredients, description: item.description, trending: item.trending, dailyDeal: item.dailyDeal, count: amount, size: size)
        items.append(newPizza)
    }
    
    func remove(item : Pizza, amount : Int = 1) {
        for i in 0..<items.count {
            if items[i].size == item.size && items[i].name == item.name {
                if items[i].count < amount + 1 {
                    items.remove(at: i)
                    return
                } else {
                    items[i].count -= amount
                    return
                }
            }
        }
    }
    
    func contains(item : Pizza) -> Bool {
        for i in 0..<items.count {
            if items[i].name == item.name && items[i].size == item.size {
                return true
            }
        }
        return false
    }
    
    func total() -> Double {
        var total = 0.0
        for i in 0..<items.count {
            let price : Double = Double(items[i].count) * (items[i].dailyDeal ? 0.8 : 1.0)
            switch (items[i].size) {
            case "S": total += items[i].sPrice * price
            case "M": total += items[i].mPrice * price
            case "L": total += items[i].lPrice * price
            default: break
            }
        }
        return total
    }
    
}


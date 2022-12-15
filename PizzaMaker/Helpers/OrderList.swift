//
//  OrderList.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/15/22.
//

import SwiftUI

class OrderList : ObservableObject {
    @Published var items = [Pizza]()
    
    func add(item : Pizza) {
        if (items.firstIndex(of: item) == nil) {
            items.append(item)
        }
    }
    
    func remove(item : Pizza) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func contains(item : Pizza) -> Bool {
        if (items.firstIndex(of: item) == nil) {
            return false
        }
        return true
    }
}


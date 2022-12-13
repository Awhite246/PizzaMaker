//
//  Order.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/5/22.
//

import SwiftUI

struct Order: View {
    var body: some View {
        VStack {
            Text("Order")
        }
        .preferredColorScheme(.dark)
        .background(Color("RichBlack"))
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order()
    }
}

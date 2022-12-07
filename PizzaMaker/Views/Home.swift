//
//  Home.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/2/22.
//

import SwiftUI

struct Home: View {
    let dailyDeals = ["Pepperoni", "Sausage"]
    let trending = ["Pepperoni", "Sausage"]
    var body: some View {
        VStack {
            Text("Daily Deals")
                .offset(x: -130)
                .font(.title2).bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dailyDeals, id: \.self) { pizza in
                        VStack {
                            Image(pizza)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Text(pizza)
                        }
                    }
                }
            }
            Text("Trending")
                .offset(x: -150)
                .font(.title2).bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(trending, id: \.self) { pizza in
                        VStack {
                            Image(pizza)
                                .resizable()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Text(pizza)
                        }
                    }
                }
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

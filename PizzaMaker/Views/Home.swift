//
//  Home.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/2/22.
//

import SwiftUI

struct Home: View {
    let menu = Bundle.main.decode([Pizza].self, from: "menu.json")
    @State var scrollOffset = CGFloat.zero
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Daily Deals")
                    .foregroundColor(Color(.black))
                    .offset(x: -75, y : 30)
                    .font(.system(size: 50))
                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        HStack {
                            ForEach(menu) { pizza in
                                HomeItem(pizza: pizza)
                                    .padding(.leading, 30)
                            }
                        }
                    }
                }
                .padding(.bottom, -50)
                Text("Trending")
                    .foregroundColor(Color(.black))
                    .offset(x: -100, y: 30)
                    .font(.system(size: 50))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(menu) { pizza in
                            HomeItem(pizza: pizza)
                                .padding(.leading, 30)
                        }
                    }
                }
                Color.clear
                    .frame(height: 20)
            }
        }
        .preferredColorScheme(.light)
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

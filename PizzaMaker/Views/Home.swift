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
    @State var scrollOffset = CGFloat.zero
    var body: some View {
        VStack {
            ObservableScrollView(scrollOffset: $scrollOffset) { proxy in
                Text("Daily Deals")
                    .offset(x: -75, y : 30)
                    .font(.system(size: 50))
                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        HStack {
                            ForEach(dailyDeals, id: \.self) { pizza in
                                VStack {
                                    Image(pizza)
                                        .resizable()
                                        .frame(width: (scrollOffset > 250) ? 100 : (350 - (scrollOffset)), height: (scrollOffset > 250) ? 100 : (350 - (scrollOffset)))
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                    ZStack {
                                        Color(uiColor: .darkGray)
                                            .frame(width:100, height: 40)
                                            .clipShape(RoundedRectangle(cornerRadius: 7))
                                            .opacity(0.8)
                                        VStack {
                                            Text(pizza)
                                            HStack {
                                                Text("0.00")
                                                Text("0.00")
                                                    .foregroundColor(Color(uiColor: .gray))
                                                    .strikethrough()
                                            }
                                        }
                                    }
                                    .offset(y: -25)
                                }
                            }
                        }
                    }
                }
                Text("Trending")
                    .offset(x: -100, y: 30)
                    .font(.system(size: 50))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(trending, id: \.self) { pizza in
                            VStack {
                                Image(pizza)
                                    .resizable()
                                    .frame(width: (scrollOffset > 250) ? 350 : ((scrollOffset ) + 100), height: (scrollOffset > 250) ? 350 : ((scrollOffset) + 100))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                ZStack {
                                    Color(uiColor: .darkGray)
                                        .frame(width:100, height: 40)
                                        .clipShape(RoundedRectangle(cornerRadius: 7))
                                        .opacity(0.8)
                                    VStack {
                                        Text(pizza)
                                        Text("0.00")
                                    }
                                }
                                .offset(y: -25)
                                Image(systemName: "star.fill")
                                    .offset(x:55, y: -195)
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
                Color.clear
                    .frame(height: 200)
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

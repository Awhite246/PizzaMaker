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
            ScrollView(.vertical, showsIndicators: false) {
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
                                        .frame(width: 300, height: 300)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .padding(.trailing, 10)
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
                .padding(.bottom, -50)
                Text("Trending")
                    .offset(x: -100, y: 30)
                    .font(.system(size: 50))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(trending, id: \.self) { pizza in
                            VStack {
                                Image(pizza)
                                    .resizable()
                                    .frame(width: 300, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.trailing, 10)
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
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .offset(x:120, y: -350)
                                    .foregroundColor(.yellow)
                                Image(systemName: "bookmark.fill")
                                    .resizable()
                                    .frame(width: 25, height: 45)
                                    .offset(x:-120, y: -400)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                Color.clear
                    .frame(height: 20)
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

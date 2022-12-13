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
                    .foregroundColor(Color("Eggshell"))
                    .offset(x: -75, y : 30)
                    .font(.system(size: 50))
                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        HStack {
                            ForEach(menu) { pizza in
                                if pizza.dailyDeal {
                                    VStack {
                                        HStack {
                                            Image(pizza.name)
                                                .resizable()
                                                .frame(width: 300, height: 300)
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .foregroundColor(Color("Eggshell"))
                                        }
                                        .padding(.trailing, 10)
                                        ZStack {
                                            Color("PrussianBlue")
                                                .frame(width:150, height: 40)
                                                .clipShape(RoundedRectangle(cornerRadius: 7))
                                                .opacity(0.8)
                                            VStack {
                                                HStack {
                                                    Text(pizza.name)
                                                        .foregroundColor(Color("Eggshell"))
                                                    if pizza.trending {
                                                        Image(systemName: "star.fill")
                                                            .foregroundColor(Color("ShadowBlue"))
                                                    }
                                                }
                                                HStack {
                                                    Text(String(format: "%.2f", pizza.sPrice * 8 / 10))
                                                        .foregroundColor(Color("Eggshell"))
                                                    Text(String(format: "%.2f", pizza.sPrice))
                                                        .foregroundColor(Color("DarkElectricBlue"))
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
                }
                .padding(.bottom, -50)
                Text("Trending")
                    .foregroundColor(Color("Eggshell"))
                    .offset(x: -100, y: 30)
                    .font(.system(size: 50))
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(menu) { pizza in
                            if pizza.trending {
                                VStack {
                                    Image(pizza.name)
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .padding(.trailing, 10)
                                    ZStack {
                                        Color("PrussianBlue")
                                            .frame(width:150, height: 40)
                                            .clipShape(RoundedRectangle(cornerRadius: 7))
                                            .opacity(0.8)
                                        VStack {
                                            HStack {
                                                Text(pizza.name)
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(Color("ShadowBlue"))
                                            }
                                            HStack {
                                                Text(String(format: "%.2f", (pizza.dailyDeal ? (pizza.sPrice * 8 / 10) : (pizza.sPrice))))
                                                    .foregroundColor(Color("Eggshell"))
                                                if pizza.dailyDeal {
                                                    Text(String(format: "%.2f", (pizza.sPrice)))
                                                        .foregroundColor(Color("DarkElectricBlue"))
                                                        .strikethrough()
                                                }
                                            }
                                        }
                                    }
                                    .offset(y: -25)
                                }
                            }
                        }
                    }
                }
                Color.clear
                    .frame(height: 20)
            }
        }
        .preferredColorScheme(.dark)
        .background(Color("RichBlack"))
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

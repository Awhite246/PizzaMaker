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
            ZStack {
                Image("Pizza Logo")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: 400, height: 200)
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)
                    .frame(height:100)
                    .offset(y: 50)
                HStack {
                    Image(systemName: "star.circle")
                        .foregroundColor(Color("Tangerine"))
                    Text("Daily Deal ")
                    .foregroundColor(Color("Honeydew"))
                    Text("•")
                        .font(.system(size: 50))
                        .offset(y: -2)
                        .foregroundColor(Color("Honeydew"))
                    Image(systemName: "flame.circle")
                        .foregroundColor(Color("Vermilion"))
                    Text("Trending")
                    .foregroundColor(Color("Honeydew"))
                }
                .offset(x: -65, y: 75)
            }
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        HStack {
                            ForEach(menu) { pizza in
                                if pizza.dailyDeal {
                                    HomeItem(pizza: pizza)
                                        .padding(10)
                                }
                            }
                        }
                    }
                }
                Divider()
                Text("Recomended For You")
                    .foregroundColor(Color("Imperial Red"))
                    .bold()
                    .font(.system(size: 20))
                    .padding(.bottom, -10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(menu) { pizza in
                            if pizza.trending {
                                HomeItem(pizza: pizza)
                                    .padding(10)
                            }
                        }
                    }
                }
                Color.clear
                    .frame(height: 20)
            }
            .padding(.top, -30)
        }
        .preferredColorScheme(.light)
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

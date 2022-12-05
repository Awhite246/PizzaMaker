//
//  Home.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/2/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("Todays Deals")
                .offset(x: -130)
                .font(.title2).bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5, id: \.self) { i in
                        Image("pizza")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
            }
            .padding(.bottom, 100)
            Text("Trending")
                .offset(x: -150)
                .font(.title2).bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5, id: \.self) { i in
                        Image("pizza")
                            .resizable()
                            .frame(width: 100, height: 100)
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

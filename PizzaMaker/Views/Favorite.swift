//
//  Favorite.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/7/22.
//

import SwiftUI

struct Favorite: View {
    @EnvironmentObject var favoriteList : FavoriteList
    @EnvironmentObject var orderList : OrderList
    var body: some View {
        //similar to order, except only shows items in favorite list instead of order list
        VStack {
            ZStack {
                Color("Imperial Red")
                    .ignoresSafeArea()
                    .frame(width: 400, height: 80)
                Text("Favorited Pizzas")
                    .font(.title).bold()
                    .foregroundColor(Color("Honeydew"))
                    .padding(.top, -10)
                LinearGradient(gradient: Gradient(colors: [Color("Imperial Red"), Color.white]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 400, height: 20)
                    .offset(y: 30)
            }
            ZStack {
                if favoriteList.items.isEmpty {
                    VStack {
                        HStack {
                            ForEach (0...2, id: \.self) { _ in
                                Text("☹️")
                                    .grayscale(1)
                                    .colorMultiply(Color(uiColor: .lightGray))
                                    .font(.system(size: 40))
                            }
                        }
                        Text("No Pizzas Here")
                        Text("Go Like Some Pizzas!!")
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(uiColor: .lightGray))
                }
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(favoriteList.items) { pizza in
                            MenuItem(pizza: pizza)
                        }
                    }
                }
                .padding(.top, -25)
            }
        }
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
            .environmentObject(FavoriteList())
            .environmentObject(OrderList())
    }
}

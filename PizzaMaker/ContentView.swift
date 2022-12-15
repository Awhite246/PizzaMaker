//
//  ContentView.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var favoriteList : FavoriteList
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.bullet")
                }
            Favorite()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            Order()
                .tabItem {
                    Label("Order", systemImage: "cart")
                }
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FavoriteList())
    }
}

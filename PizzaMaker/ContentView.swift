//
//  ContentView.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/2/22.
//

import SwiftUI

/*  Images from:
 * <a href="https://www.flaticon.com/free-icons/home" title="home icons">Home icons created by Dave Gandy - Flaticon</a>
 *
 *
 */
struct ContentView: View {
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Label("Home", systemImage: "square.grid.2x2")
                }
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.bullet")
                }
            Order()
                .tabItem {
                    Label("Order", systemImage: "cart")
                }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

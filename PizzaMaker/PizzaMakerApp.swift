//
//  PizzaMakerApp.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/2/22.
//

import SwiftUI

@main
struct PizzaMakerApp: App {
    @StateObject var favoriteList = FavoriteList()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoriteList)
        }
    }
}

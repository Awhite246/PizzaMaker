//
//  Favorite.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/7/22.
//

import SwiftUI

struct Favorite: View {
    @EnvironmentObject var favoriteList : FavoriteList
    var body: some View {
        VStack {
            Text("Favorite")
        }
        .preferredColorScheme(.dark)
        .background(Color("Champagne"))
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite().environmentObject(FavoriteList())
    }
}

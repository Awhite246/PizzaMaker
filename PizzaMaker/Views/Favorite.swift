//
//  Favorite.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/7/22.
//

import SwiftUI

struct Favorite: View {
    var body: some View {
        VStack {
            Text("Favorite")
        }
        .preferredColorScheme(.dark)
        .background(Color("RichBlack"))
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
    }
}

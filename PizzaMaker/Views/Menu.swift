//
//  Menu.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/5/22.
//

import SwiftUI

struct Menu: View {
    let menu = Bundle.main.decode([Pizza].self, from: "menu.json")
    @State var showingDetail = false
    var body: some View {
        VStack {
            ZStack {
                Text("Menu")
                    .font(.title).bold()
                    .foregroundColor(Color("Imperial Red"))
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(menu) { pizza in
                        HomeItem(pizza: pizza)
                    }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("Powder Blue"), Color("Pastel Pink")]), startPoint: .top, endPoint: .bottom))
    }
}
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

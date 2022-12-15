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
    @State var allItems = true
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Color("Imperial Red")
                        .frame(height: 150)
                        .padding(.bottom, -10)
                    HStack {
                        Color("Celadon Blue")
                            .frame(height: 50)
                    }
                }
                Text("Menu")
                    .font(.title).bold()
                    .foregroundColor(Color("Honeydew"))
                HStack {
                    Button {
                        withAnimation {
                            allItems = true
                        }
                    } label: {
                        VStack {
                            Image(systemName: "square.grid.2x2.fill")
                            Text("All Items")
                        }
                    }
                    .foregroundColor(Color(!allItems ? "Honeydew" : "Pastel Pink"))
                    .padding(.trailing, 50)
                    Button {
                        withAnimation {
                            allItems = false
                        }
                    } label: {
                        VStack {
                            Image(systemName: "tag.circle")
                            Text("All Specials")
                        }
                    }
                    .foregroundColor(Color(allItems ? "Honeydew" : "Pastel Pink"))
                    .padding(.leading, 50)
                    .offset(x: 10)
                }
                .offset(y: 75)
            }
            .ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(menu) { pizza in
                        if allItems {
                            MenuItem(pizza: pizza)
                        } else {
                            if pizza.dailyDeal || pizza.trending || pizza.favorite {
                                MenuItem(pizza: pizza)
                            }
                        }
                    }
                }
            }
            .padding(.top, -65)
        }
    }
}
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

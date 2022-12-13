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
    @State var currentPizza = Pizza(id: UUID(uuidString: "5d5198e0-5389-4e62-bb1f-55680b977af5")!, name: "Cheese", sPrice: 1.00, mPrice: 2.00, lPrice: 3.00, ingredients: [Ingredient(id: UUID(uuidString: "1142be9c-fffb-4b78-87cf-5259cc85036c")!, name: "Test", count: 1)], description: "Our exeptional pizza turns simple into sublime, with the delicious combination of crispy pizza crust, flavorful tomato sauce, and bubbly cheese make for an unbeatable combination. You've got perfection on a plate.", trending: true, dailyDeal: true, favorite: true)
    var body: some View {
        List {
            ForEach(menu) { pizza in
                Button {
                    currentPizza = pizza
                    showingDetail = true
                } label: {
                    HStack {
                        Text("\(pizza.name)")
                            .foregroundColor(Color("Eggshell"))
                        if pizza.trending {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("ShadowBlue"))
                        }
                        Spacer()
                        Image("\(pizza.name)")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .listRowBackground(Color("PrussianBlue"))
        }
        .fullScreenCover(isPresented: $showingDetail, content: {
            Detail(pizza: currentPizza)
        })
        .background(Color("Champagne"))
        .scrollContentBackground(.hidden)
        .preferredColorScheme(.dark)
    }
}
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

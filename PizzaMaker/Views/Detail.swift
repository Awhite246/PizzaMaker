//
//  Detail.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/9/22.
//

import SwiftUI

struct Detail: View {
    let pizza: Pizza
    var body: some View {
        VStack {
            Image(pizza.name)
                .resizable()
                .frame(width:400, height: 400)
                .ignoresSafeArea()
                .padding(.bottom, -55)
            Text(pizza.name)
                .font(.title).bold()
                .foregroundColor(Color("Eggshell"))
            Text(pizza.description)
                .font(.system(size: 20))
                .padding(.horizontal, 5)
                .padding(.bottom, 10)
                .padding(.top, 1)
                .foregroundColor(Color("Eggshell"))
            ForEach (pizza.ingredients) { ingredient in
                HStack {
                    Text("\(ingredient.name): \(ingredient.count)")
                        .font(.caption)
                        .padding(.horizontal, 10)
                    Spacer()
                }
            }
            Spacer()
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        Color("ShadowBlue")
                            .frame(width:100, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        VStack {
                            Image(systemName: "cart.badge.plus")
                                .resizable()
                                .frame(width: 40, height: 35)
                            Text("Add to Cart")
                        }
                        .tint(Color("Eggshell"))
                    }
                    .offset(y: 45)
                }
                .padding(.horizontal, 50)
                Button {
                    
                } label: {
                    ZStack {
                        Color("ShadowBlue")
                            .frame(width:100, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        VStack {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 35, height: 35)
                            Text("Customize Pizza")
                        }
                        .tint(Color("Eggshell"))
                    }
                    .offset(y: 45)
                }
                .padding(.horizontal, 50)
            }
        }
        .preferredColorScheme(.dark)
        .background(Color("Champagne"))
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(pizza: Pizza(id: UUID(uuidString: "5d5198e0-5389-4e62-bb1f-55680b977af5")!, name: "Cheese", sPrice: 1.00, mPrice: 2.00, lPrice: 3.00, ingredients: [Ingredient(id: UUID(uuidString: "1142be9c-fffb-4b78-87cf-5259cc85036c")!, name: "Test", count: 1)], description: "This cheese pizza is the perfect classic. It's made with a hand-stretched thin crust, topped with a delicious tomato sauce, and covered with a blanket of melty mozzarella cheese. To finish it off, it's baked in our hot brick oven, giving it a crispy, golden-brown crust. Get ready to enjoy the perfect combination of tangy tomato sauce, gooey cheese, and a light, flaky crust.", trending: true, dailyDeal: true, favorite: true))
    }
}

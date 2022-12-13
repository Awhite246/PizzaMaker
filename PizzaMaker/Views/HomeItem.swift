//
//  HomeItem.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/13/22.
//

import SwiftUI

struct HomeItem: View {
    let pizza: Pizza
    @State private var like = false
    @State private var size = 20.0
    var body: some View {
        VStack {
            ZStack {
                Color("Honeydew")
                    .frame(width: 200, height: 300)
                    .overlay {
                        Image(pizza.name)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .ignoresSafeArea()
                            .offset(y: -50)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                Button {
                    like.toggle()
                    withAnimation(){
                        if like {
                            size += 5
                        } else {
                            size -= 5
                        }
                    }
                } label: {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(Color("Imperial Red"))
                        .frame(width: size, height: size)
                }
                .animation(.interpolatingSpring(stiffness: 100, damping: 7), value: size)
                .offset(x: -75, y: 75)
                Text(like ? "You like this pizza!" : "Like this pizza!")
                    .foregroundColor(Color("Pastel Pink"))
                    .multilineTextAlignment(.leading)
                    .offset(x: like ? 15 : 5, y: 75)
                Text(pizza.name)
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(Color("Prussian Blue"))
                    .offset(y: 100)
                HStack {
                    Text("\(String(format: "%.2f", (pizza.dailyDeal ? (pizza.sPrice * 0.8) : (pizza.sPrice))))")
                        .foregroundColor(Color("Prussian Blue"))
                    if pizza.dailyDeal {
                        Text("\(String(format: "%.2f", pizza.sPrice))")
                            .strikethrough()
                            .foregroundColor(Color(uiColor: .lightGray))
                    }
                }
                .offset(y: 125)
                .font(.system(size: 15))
            }
        }
    }
}

struct HomeItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeItem(pizza: Pizza(id: UUID(uuidString: "5d5198e0-5389-4e62-bb1f-55680b977af5")!, name: "Cheese", sPrice: 1.00, mPrice: 2.00, lPrice: 3.00, ingredients: [Ingredient(id: UUID(uuidString: "1142be9c-fffb-4b78-87cf-5259cc85036c")!, name: "Test", count: 1)], description: "This cheese pizza is the perfect classic. It's made with a hand-stretched thin crust, topped with a delicious tomato sauce, and covered with a blanket of melty mozzarella cheese. To finish it off, it's baked in our hot brick oven, giving it a crispy, golden-brown crust. Get ready to enjoy the perfect combination of tangy tomato sauce, gooey cheese, and a light, flaky crust.", trending: true, dailyDeal: true, favorite: true))
    }
}

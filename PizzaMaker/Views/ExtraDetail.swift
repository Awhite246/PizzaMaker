//
//  ExtraDetail.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/14/22.
//

import SwiftUI

struct ExtraDetail: View {
    let pizza : Pizza
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            List {
                HStack {
                    Spacer()
                    Text(pizza.name)
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                }
                .listRowBackground(Color("Celadon Blue"))
                .foregroundColor(Color("Honeydew"))
                HStack {
                    Spacer()
                    Text("Ingredients")
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                }
                .listRowBackground(Color("Imperial Red"))
                .foregroundColor(Color("Honeydew"))
                ForEach(pizza.ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        Text("\(ingredient.count)")
                    }
                    .foregroundColor(Color("Celadon Blue"))
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color("Honeydew"))
                HStack {
                    Spacer()
                    Text("Prices")
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                }
                .listRowBackground(Color("Imperial Red"))
                .foregroundColor(Color("Honeydew"))
                HStack {
                    Text("Large Pizza:")
                    Spacer()
                    Text("$\(String(format: "%.2f", pizza.lPrice * (pizza.dailyDeal ? 0.8 : 1.0)))")
                    if pizza.dailyDeal {
                        Text("$\(String(format: "%.2f", pizza.lPrice))")
                            .padding(.leading, 10)
                            .strikethrough()
                    }
                }
                .foregroundColor(Color("Celadon Blue"))
                .listRowBackground(Color("Honeydew"))
                HStack {
                    Text("Medium Pizza:")
                    Spacer()
                    Text("$\(String(format: "%.2f", pizza.mPrice * (pizza.dailyDeal ? 0.8 : 1.0)))")
                    if pizza.dailyDeal {
                        Text("$\(String(format: "%.2f", pizza.mPrice))")
                            .padding(.leading, 10)
                            .strikethrough()
                    }
                }
                .foregroundColor(Color("Celadon Blue"))
                .listRowBackground(Color("Honeydew"))
                HStack {
                    Text("Small Pizza:")
                    Spacer()
                    Text("$\(String(format: "%.2f", pizza.sPrice * (pizza.dailyDeal ? 0.8 : 1.0)))")
                    if pizza.dailyDeal {
                        Text("$\(String(format: "%.2f", pizza.sPrice))")
                            .padding(.leading, 10)
                            .strikethrough()
                    }
                }
                .foregroundColor(Color("Celadon Blue"))
                .listRowBackground(Color("Honeydew"))
                HStack {
                    Spacer()
                    Text("Description")
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                }
                .listRowBackground(Color("Imperial Red"))
                .foregroundColor(Color("Honeydew"))
                Text(pizza.description)
                    .foregroundColor(Color("Celadon Blue"))
                    .listRowBackground(Color("Honeydew"))
                    .frame(height:112)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Back")
                            .font(.system(size: 30))
                            .bold()
                        Spacer()
                    }
                }
                .listRowBackground(Color("Pastel Pink"))
                .foregroundColor(Color("Honeydew"))
                
            }
        }
        .background(Image(pizza.name)
            .resizable()
            .frame(width: 900, height: 900)
            .blur(radius: 15))
        .scrollContentBackground(.hidden)
        .preferredColorScheme(.light)
    }
}

struct ExtraDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExtraDetail(pizza: Pizza(id: UUID(uuidString: "5d5198e0-5389-4e62-bb1f-55680b977af5")!, name: "Cheese", sPrice: 1.00, mPrice: 2.00, lPrice: 3.00, ingredients: [Ingredient(id: UUID(uuidString: "1142be9c-fffb-4b78-87cf-5259cc85036c")!, name: "Test", count: 1)], description: "This cheese pizza is the perfect classic. It's made with a hand-stretched thin crust, topped with a delicious tomato sauce, and covered with a blanket of melty mozzarella cheese. To finish it off, it's baked in our hot brick oven, giving it a crispy, golden-brown crust. Get ready to enjoy the perfect combination of tangy tomato sauce, gooey cheese, and a light, flaky crust.", trending: true, dailyDeal: true, favorite: true))
    }
}

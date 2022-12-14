//
//  Detail.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/9/22.
//

import SwiftUI

struct Detail: View {
    let pizza: Pizza
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var moreDetails = false
    @State private var customizePizza = false
    var body: some View {
        VStack {
            ZStack {
                Image(pizza.name)
                    .resizable()
                    .frame(width:400, height: 400)
                    .ignoresSafeArea()
                    .padding(.bottom, -55)
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.white]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 400, height: 100)
                    .offset(y: 120)
                ZStack {
                    RadialGradient(gradient: Gradient(colors: [Color.black, Color.clear]), center: .center, startRadius: 7, endRadius: 25)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.uturn.backward.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("Powder Blue"))
                    }
                }
                .offset(x: -140, y: -180)
                Text(pizza.name)
                    .font(.title).bold()
                    .foregroundColor(Color("Prussian Blue"))
                    .offset(y: 145)
            }
            .offset(y: 1)
            ZStack {
                Color("Powder Blue")
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 350, height: 235)
                ScrollView(.vertical, showsIndicators: true) {
                    Text(pizza.description)
                        .font(.system(size: 20))
                        .padding(.horizontal, 5)
                        .foregroundColor(Color("Celadon Blue"))
                }
                .frame(width: 345, height: 225)
            }
            Button {
                    moreDetails = true
            } label: {
                HStack {
                    Text("More Details")
                    Image(systemName: "arrowtriangle.up.fill")
                    Spacer()
                }
                .padding(.horizontal, 10)
            }
            Spacer()
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        Color("Pastel Pink")
                            .frame(width:100, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        VStack {
                            Image(systemName: "cart.badge.plus")
                                .resizable()
                                .frame(width: 40, height: 35)
                            Text("Add to Cart")
                        }
                        .tint(Color("Honeydew"))
                    }
                    .offset(y: 45)
                }
                .padding(.horizontal, 50)
                Button {
                    customizePizza = true
                } label: {
                    ZStack {
                        Color("Pastel Pink")
                            .frame(width:100, height: 130)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        VStack {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .frame(width: 35, height: 35)
                            Text("Customize Pizza")
                        }
                        .tint(Color("Honeydew"))
                    }
                    .offset(y: 45)
                }
                .padding(.horizontal, 50)
            }
        }
        .sheet(isPresented: $moreDetails, content: {
            
        })
        .sheet(isPresented: $customizePizza, content: {
            
        })
        .preferredColorScheme(.light)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(pizza: Pizza(id: UUID(uuidString: "5d5198e0-5389-4e62-bb1f-55680b977af5")!, name: "Cheese", sPrice: 1.00, mPrice: 2.00, lPrice: 3.00, ingredients: [Ingredient(id: UUID(uuidString: "1142be9c-fffb-4b78-87cf-5259cc85036c")!, name: "Test", count: 1)], description: "This cheese pizza is the perfect classic. It's made with a hand-stretched thin crust, topped with a delicious tomato sauce, and covered with a blanket of melty mozzarella cheese. To finish it off, it's baked in our hot brick oven, giving it a crispy, golden-brown crust. Get ready to enjoy the perfect combination of tangy tomato sauce, gooey cheese, and a light, flaky crust.", trending: true, dailyDeal: true, favorite: true))
    }
}

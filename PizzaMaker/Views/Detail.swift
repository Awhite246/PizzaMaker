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
    @State private var size = "S"
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
                if pizza.dailyDeal {
                    Group {
                        EllipticalGradient(colors:[Color.black, Color.clear], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.3)
                            .frame(width: 350, height: 50)
                            .offset(x: 50)
                        Text("Daily Deal")
                            .foregroundColor(Color("Honeydew"))
                            .bold()
                            .font(.system(size: 20))
                            .offset(x: 65)
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(Color("Tangerine"))
                            .frame(width: 25, height: 25)
                    }
                    .offset(x: -175, y: -135)
                }
                if pizza.trending {
                    Group {
                        EllipticalGradient(colors:[Color.black, Color.clear], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.3)
                            .frame(width: 350, height: 50)
                            .offset(x: 50)
                        Text("Trending")
                            .foregroundColor(Color("Honeydew"))
                            .bold()
                            .font(.system(size: 20))
                            .offset(x: 60)
                        Image(systemName: "flame.circle")
                            .resizable()
                            .foregroundColor(Color("Vermilion"))
                            .frame(width: 25, height: 25)
                    }
                    .offset(x: -175, y: pizza.dailyDeal ? -100 : -135)
                }
            }
            .offset(y: 10)
            ZStack {
                Color("Honeydew")
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 350, height: 155)
                ScrollView(.vertical, showsIndicators: true) {
                    Text(pizza.description)
                        .font(.system(size: 20))
                        .padding(.horizontal, 5)
                }
                .frame(width: 345, height: 145)
            }
            .offset(y: 0)
            Button {
                moreDetails = true
            } label: {
                HStack {
                    Text("More Details")
                    Image(systemName: "arrowtriangle.up.fill")
                    Spacer()
                }
                .foregroundColor(Color("Pastel Pink"))
                .padding(.horizontal, 10)
            }
            .offset(y: 0)
            Group{
                Text("Pizza Size:")
                Picker(selection: $size, label: Text("Picker")) {
                    Text("S").tag("S")
                    Text("M").tag("M")
                    Text("L").tag("L")
                }
                .frame(width: 350)
                .pickerStyle(.segmented)
                HStack {
                    Text("Price: \(String(format:"%.2f", getPrice() * (pizza.dailyDeal ? 0.8 : 1)))")
                    if pizza.dailyDeal {
                        Text("\(String(format: "%.2f", getPrice()))")
                            .strikethrough()
                            .foregroundColor(Color(uiColor: .lightGray))
                    }
                }
            }
            .offset(y: 20)
            //Spacer()
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        Color("Imperial Red")
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
                        Color("Imperial Red")
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
            ExtraDetail()
        })
        .sheet(isPresented: $customizePizza, content: {
            
        })
        .preferredColorScheme(.light)
    }
    private func getPrice() -> Double {
        switch (size) {
        case "S": return pizza.sPrice
        case "M": return pizza.mPrice
        case "L": return pizza.lPrice
        default: return 0.0
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(pizza: Pizza(id: UUID(uuidString: "5d5198e0-5389-4e62-bb1f-55680b977af5")!, name: "Cheese", sPrice: 1.00, mPrice: 2.00, lPrice: 3.00, ingredients: [Ingredient(id: UUID(uuidString: "1142be9c-fffb-4b78-87cf-5259cc85036c")!, name: "Test", count: 1)], description: "This cheese pizza is the perfect classic. It's made with a hand-stretched thin crust, topped with a delicious tomato sauce, and covered with a blanket of melty mozzarella cheese. To finish it off, it's baked in our hot brick oven, giving it a crispy, golden-brown crust. Get ready to enjoy the perfect combination of tangy tomato sauce, gooey cheese, and a light, flaky crust.", trending: true, dailyDeal: false, favorite: true))
    }
}

//
//  MenuItem.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/14/22.
//

import SwiftUI

struct MenuItem: View {
    @EnvironmentObject var favoriteList : FavoriteList
    @EnvironmentObject var orderList : OrderList
    let pizza: Pizza
    @State private var like = false
    @State private var size = 15.0
    @State private var showingDetail = false
    var body: some View {
        VStack {
            ZStack {
                Color("Honeydew")
                    .frame(width: 180, height: 290)
                    .overlay {
                        Image(pizza.name)
                            .resizable()
                            .frame(width: 180, height: 180)
                            .ignoresSafeArea()
                            .offset(y: -55)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                HStack {
                    if pizza.dailyDeal {
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [Color.black, Color.clear]), center: .center, startRadius: 5, endRadius: 11)
                                .frame(width: 25, height: 25)
                            Image(systemName: "star.circle.fill")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundColor(Color("Tangerine"))
                        }
                        .offset(x: pizza.trending ? 0 : -14)
                    }
                    if pizza.trending {
                        ZStack {
                            RadialGradient(gradient: Gradient(colors: [Color.black, Color.clear]), center: .center, startRadius: 5, endRadius: 11)
                                .frame(width: 25, height: 25)
                            Image(systemName: "flame.circle.fill")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundColor(Color("Vermilion"))
                        }
                        .offset(x: pizza.dailyDeal ? -2 : -18)
                    }
                }
                .offset(x: -50, y: -120)
                Button {
                    like.toggle()
                    withAnimation(){
                        if like {
                            size += 3
                            favoriteList.add(item: pizza)
                        } else {
                            size -= 3
                            favoriteList.remove(item: pizza)
                        }
                    }
                } label: {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(Color("Imperial Red"))
                        .frame(width: size, height: size)
                }
                .animation(.interpolatingSpring(stiffness: 100, damping: 7), value: size)
                .offset(x: 75, y: 50)
                Text(pizza.name)
                    .bold()
                    .font(.system(size: 20))
                    .foregroundColor(Color("Prussian Blue"))
                    .offset(y: 65)
                HStack {
                    Text("$\(String(format: "%.2f", (pizza.dailyDeal ? (pizza.sPrice * 0.8) : (pizza.sPrice))))")
                        .foregroundColor(Color("Prussian Blue"))
                    if pizza.dailyDeal {
                        Text("$\(String(format: "%.2f", pizza.sPrice))")
                            .strikethrough()
                            .foregroundColor(Color(uiColor: .lightGray))
                    }
                }
                .offset(y: 90)
                .font(.system(size: 15))
                Button {
                    showingDetail = true
                } label: {
                    VStack {
                        Text("View Details")
                            .foregroundColor(Color("Celadon Blue"))
                            .padding(.bottom, -15)
                        Text("and Order")
                            .foregroundColor(Color("Celadon Blue"))
                    }
                }
                .offset(y: 120)
            }
        }
        .fullScreenCover(isPresented: $showingDetail) {
            Detail(pizza: pizza)
        }
        .onAppear {
            if favoriteList.contains(item: pizza) {
                like = true
                size = 18.0
            } else {
                like = false
                size = 15.0
            }
        }
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(pizza: Pizza(id: UUID(uuidString: "5d5198e0-5389-4e62-bb1f-55680b977af5")!, name: "Cheese", sPrice: 1.00, mPrice: 2.00, lPrice: 3.00, ingredients: [Ingredient(id: UUID(uuidString: "1142be9c-fffb-4b78-87cf-5259cc85036c")!, name: "Test", count: 1)], description: "This cheese pizza is the perfect classic. It's made with a hand-stretched thin crust, topped with a delicious tomato sauce, and covered with a blanket of melty mozzarella cheese. To finish it off, it's baked in our hot brick oven, giving it a crispy, golden-brown crust. Get ready to enjoy the perfect combination of tangy tomato sauce, gooey cheese, and a light, flaky crust.", trending: true, dailyDeal: true, count: 1, size: "S"))
            .environmentObject(FavoriteList())
            .environmentObject(OrderList())
    }
}

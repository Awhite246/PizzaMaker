//
//  Order.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/5/22.
//

import SwiftUI

struct Order: View {
    @EnvironmentObject var orderList : OrderList
    var body: some View {
        VStack {
            ZStack {
                Color("Imperial Red")
                    .ignoresSafeArea()
                    .frame(width: 400, height: 80)
                Text("Ordered Pizzas")
                    .font(.title).bold()
                    .foregroundColor(Color("Honeydew"))
                    .padding(.top, -10)
                LinearGradient(gradient: Gradient(colors: [Color("Imperial Red"), Color.white]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 400, height: 20)
                    .offset(y: 30)
            }
            ZStack {
                if orderList.items.isEmpty {
                    VStack {
                        HStack {
                            ForEach (0...2, id: \.self) { _ in
                                Text("☹️")
                                    .grayscale(1)
                                    .colorMultiply(Color(uiColor: .lightGray))
                                    .font(.system(size: 40))
                            }
                        }
                        Text("No Pizzas Here")
                        Text("Go Order Some Pizzas!!")
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(uiColor: .lightGray))
                }
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(orderList.items) { pizza in
                            OrderItem(pizza: pizza)
                        }
                    }
                }
                .padding(.top, -25)
                .frame(width: 400, height: 580)
                if !orderList.items.isEmpty {
                    Color("Powder Blue")
                        .frame(width: 400, height: 130)
                        .offset(y: 350)
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color("Powder Blue")]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 400, height: 30)
                        .offset(y: 300)
                }
            }
            if orderList.items.isEmpty {
                Spacer()
            } else {
                Button {
                    
                } label: {
                    ZStack {
                        Color("Celadon Blue")
                            .frame(width:300, height: 75)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        HStack {
                            Image(systemName: "creditcard")
                                .resizable()
                                .frame(width: 40, height: 35)
                            Text("Order")
                        }
                        .tint(Color("Honeydew"))
                    }
                }
                .offset(y: 15)
            }

        }
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order().environmentObject(OrderList())
    }
}

//
//  Order.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/5/22.
//

import SwiftUI

struct Order: View {
    @EnvironmentObject var orderList : OrderList
    @State var showPay = false
    var body: some View {
        VStack {
            ZStack {
                Color("Imperial Red")
                    .ignoresSafeArea()
                    .frame(width: 400, height: orderList.items.isEmpty ? 80 : 110)
                Text("Ordered Pizzas")
                    .font(.title).bold()
                    .foregroundColor(Color("Honeydew"))
                    .padding(.top, orderList.items.isEmpty ? -10 : -65)
                if !orderList.items.isEmpty {
                    Button {
                        showPay = true;
                    } label: {
                        ZStack {
                            Color("Celadon Blue")
                                .frame(width:300, height: 75)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            HStack {
                                //Image(systemName: "banknote")
                                //    .resizable()
                                //    .frame(width: 40, height: 35)
                                Text("Order")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            .tint(Color("Honeydew"))
                        }
                    }
                    .padding(.top, 30)
                }
                LinearGradient(gradient: Gradient(colors: [Color("Imperial Red"), Color.white]), startPoint: .top, endPoint: .bottom)
                    .frame(width: 400, height: 20)
                    .offset(y: orderList.items.isEmpty ? 30 : 65)
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
                .padding(.top, 0)
            }
        }
        .fullScreenCover(isPresented: $showPay) {
            Pay()
        }
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order().environmentObject(OrderList())
    }
}

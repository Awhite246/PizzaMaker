//
//  Pay.swift
//  PizzaMaker
//
//  Created by Alistair White on 12/15/22.
//

import SwiftUI

struct Pay: View {
    @EnvironmentObject var orderList: OrderList
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var cardNumber = ""
    @State private var tipAmount = 10
    @State private var showingPaymentAlert = false
    //variables for pickup time
    let pickupTimes = ["Now", "Tonight", "Tommorow"]
    @State private var pickupTime = "Now"
    @State private var name = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            ZStack {
                Color("Prussian Blue")
                    .frame(width: 400, height: 150)
                    .ignoresSafeArea()
                Text("Payment")
                    .foregroundColor(Color("Honeydew"))
                    .font(.title).bold()
                    .padding(.top, -50)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("Pastel Pink"))
                }
                .offset(x: -150, y: -30)
            }
            Group {
                Text("Name:")
                TextField("Name", text: $name)
                Text("Card Number:")
                SecureField("Credit Card", text: $cardNumber)
            }
            .frame(width: 350)
            Divider()
            //added pick up time
            Group {
                Text("Pickup Time: ")
                Picker("Time:", selection: $pickupTime) {
                    ForEach(pickupTimes, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            .frame(width:350)
            Divider()
            Group {
                Text("Add a tip?")
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            .frame(width: 350)
            Divider()
            Group {
                Text("Order Details")
                ZStack {
                    Color("Honeydew")
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    ScrollView {
                        ForEach(orderList.items) { pizza in
                            HStack {
                                Text("\(pizza.count) \(size(pizza.size)) \(pizza.name)")
                                    .padding(.leading, 10)
                                Spacer()
                                Text("$\(String(format: "%.2f", calcPrice(item: pizza)))")
                                    .padding(.trailing, 10)
                            }
                        }
                        .padding(.top, 5)
                        Divider()
                            .padding(.bottom, 10)
                        HStack {
                            Text("Total:")
                                .padding(.leading, 10)
                            Spacer()
                            Text("$\(String(format: "%.2f", orderList.total()))")
                                .padding(.trailing, 10)
                        }
                        HStack {
                            Text("Taxes:")
                                .padding(.leading, 10)
                            Spacer()
                            Text("$\(String(format: "%.2f", orderList.total() * 0.065))")
                                .padding(.trailing, 10)
                        }
                        HStack {
                            Text("Tip:")
                                .padding(.leading, 10)
                            Spacer()
                            Text("$\(String(format: "%.2f", orderList.total() / 100 * Double(tipAmount)))")
                                .padding(.trailing, 10)
                        }
                    }
                }
                .frame(width: 350, height: 200)
            }
            Spacer()
            Group {
                Text("TOTAL: \(totalPrice)")
                    .font(.largeTitle)
                Button {
                    showingPaymentAlert.toggle()
                } label: {
                    ZStack {
                        Color("Imperial Red")
                            .frame(width:300, height: 75)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        HStack {
                            Image(systemName: "creditcard")
                                .resizable()
                                .frame(width: 40, height: 35)
                            Text("Confirm Payment")
                        }
                        .tint(Color("Honeydew"))
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed for \(name)"), message: Text("Your total was \(totalPrice) – Thank You!"), dismissButton: .default(Text("OK")))
        }
    }
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(orderList.total())
        var tipValue = 0.0
        if tipAmount != 0 {
            tipValue = total / 100 * Double(tipAmount)
        }
        let tax = total * 0.065
        
        return formatter.string(from: NSNumber(value: (total + tipValue + tax))) ?? "$0"
    }
    func size (_ pizzaSize : String) -> String {
        switch (pizzaSize) {
        case "S": return "Small"
        case "M": return "Medium"
        case "L": return "Large"
        default: return ""
        }
    }
    func calcPrice (item : Pizza) -> Double {
        var out = 0.0
        switch item.size {
        case "S": out = item.sPrice
        case "M" : out = item.mPrice
        case "L" : out = item.lPrice
        default: out = 1
        }
        out *= Double(item.count) * (item.dailyDeal ? 0.8 : 1.0)
        return out
    }
}

struct Pay_Previews: PreviewProvider {
    static var previews: some View {
        Pay().environmentObject(OrderList())
    }
}

//
//  OrderView.swift
//  iDine
//
//  Created by 이연희 on 1/4/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    func deleteItems(at offsets:IndexSet){
        order.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section{
                    NavigationLink(destination: CheckoutView()){
                        Text("Place Order")
                    }
                }.disabled(order.items.isEmpty)
                
                Section{
                    ForEach(order.items){item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                
            }
            .navigationBarTitle("Order")
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}

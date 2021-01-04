//
//  AppView.swift
//  iDine
//
//  Created by 이연희 on 1/4/21.
//  Copyright © 2021 이연희. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            OrderView()
                .tabItem{
                    Image(systemName: "squre.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}

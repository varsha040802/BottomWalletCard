//
//  ContentView.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartVM = CartViewModel()
    var body: some View {
        ZStack(alignment: .bottom) {

                   ScrollView {
                       VStack(spacing: 20) {

                           ProductActionView(id: 12,
                                             name: "A2 Cow Milk",
                                             price: 45)

                           ProductActionView(id: 111,
                                             name: "Cow Ghee",
                                             price: 65)
                       }
                       .padding()
                   }

                   BottomCartView()
                       .environmentObject(cartVM)
                       .offset(y: cartVM.totalItems > 0 ? 0 : 150)
                       .animation(.easeOut(duration: 0.25),
                                  value: cartVM.totalItems)
                       .compositingGroup() // GPU optimization
               }
               .environmentObject(cartVM)
           }
}

#Preview {
    ContentView()
}

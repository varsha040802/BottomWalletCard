//
//  CartView.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(cartVM.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("\(item.quantity) × ₹\(item.price)")
                    }
                }

                HStack {
                    Text("Total")
                    Spacer()
                    Text("₹\(cartVM.totalPrice)")
                        .bold()
                }
            }
            .navigationTitle("My Cart")
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
}

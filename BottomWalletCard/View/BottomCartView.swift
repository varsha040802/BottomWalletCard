//
//  ProductCard.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//
import SwiftUI

struct BottomCartView: View {

    @EnvironmentObject var cartVM: CartViewModel
    @State private var showCart = false

    var body: some View {
        HStack {

            VStack(alignment: .leading, spacing: 14) {
                Text("\(cartVM.totalItems) items")
                    .font(.caption)

                Text("₹\(cartVM.totalPrice)")
                    .font(.headline)
            }

            Spacer()

            Button("View Cart") {
                showCart = true
            }
            .filledButton()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 10)
        )
        .padding(.horizontal)
        .padding(.bottom, 10)
        .sheet(isPresented: $showCart) {
            CartView()
                .environmentObject(cartVM)
        }
    }
}



#Preview {
    BottomCartView()
        .environmentObject(CartViewModel())
//        .frame(height: 900)
}


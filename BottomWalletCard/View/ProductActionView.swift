//
//  ProductActionView.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//

import SwiftUI

struct ProductActionView: View {

    let id: Int
    let name: String
    let price: Int

    @EnvironmentObject var cartVM: CartViewModel

    var quantity: Int {
        cartVM.items.first(where: { $0.id == id })?.quantity ?? 0
    }

    var body: some View {
        HStack {

            if quantity == 0 {
                Button("Buy Once") {
                    cartVM.addItem(id: id, name: name, price: price)
                }
                .outlinedButton()
            } else {
                HStack {
                    Button("-") {
                        cartVM.removeItem(id: id)
                    }
                    .circleButton()

                    Text("\(quantity)")

                    Button("+") {
                        cartVM.addItem(id: id, name: name, price: price)
                    }
                    .circleButton()
                }
            }

            Button("Subscribe") {}
                .filledButton()
        }
    }
}



extension View {
    func outlinedButton() -> some View {
        self
            .font(.headline)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.green, lineWidth: 1.5)
            )
            .foregroundStyle(Color.green)
    }

    func filledButton() -> some View {
        self
            .font(.headline)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.green)
            )
            .foregroundStyle(Color.white)
    }

    func circleButton() -> some View {
        self
            .font(.headline)
            .frame(width: 36, height: 36)
            .background(
                Circle()
                    .stroke(Color.green, lineWidth: 1.5)
            )
            .foregroundStyle(Color.green)
    }
}

#Preview {
    ProductActionView(id: 102, name: "A2 Cow Milk", price: 45)
        .environmentObject(CartViewModel())
}

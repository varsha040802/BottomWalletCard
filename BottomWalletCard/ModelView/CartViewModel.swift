//
//  CardViewModel.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//

import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []

    var totalItems: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    var totalPrice: Int {
        items.reduce(0) { $0 + ($1.price * $1.quantity) }
    }

    func addItem(id: Int ,name: String, price: Int) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(id: id, name: name, price: price, quantity: 1))
        }
    }

    func removeItem(id: Int) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }
}

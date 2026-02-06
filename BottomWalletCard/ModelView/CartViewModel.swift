//
//  CardViewModel.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var items: [CardItem] = []

    var totalItems: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    var totalPrice: Int {
        items.reduce(0) { $0 + ($1.price * $1.quantity) }
    }

    func addItem(name: String, price: Int) {
        if let index = items.firstIndex(where: { $0.name == name }) {
            items[index].quantity += 1
        } else {
            items.append(CardItem(name: name, price: price, quantity: 1))
        }
    }

    func removeItem(name: String) {
        if let index = items.firstIndex(where: { $0.name == name }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }
}

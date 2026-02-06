//
//  CardItem.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//

import Foundation

struct CardItem : Identifiable{
    let id = UUID()
    let name: String
    let price: Int
    var quantity: Int 
}

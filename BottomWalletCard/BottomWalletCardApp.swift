//
//  BottomWalletCardApp.swift
//  BottomWalletCard
//
//  Created by Varsha Sahu on 06/02/26.
//

import SwiftUI

@main
struct BottomWalletCardApp: App {
    @StateObject private var CartVM = CartViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CartVM)
                .preferredColorScheme(.light)
        }
    }
}

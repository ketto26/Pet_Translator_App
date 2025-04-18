//
//  SettingsViewModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    // Published to allow the view to react to changes
    @Published var items: [SettingsItem] = [
        SettingsItem(title: "Rate Us"),
        SettingsItem(title: "Share App"),
        SettingsItem(title: "Contact Us"),
        SettingsItem(title: "Restore Purchases"),
        SettingsItem(title: "Privacy Policy"),
        SettingsItem(title: "Terms of Use")
    ]
    
    // Example of extra logic you could add later
    func didSelectItem(_ item: SettingsItem) {
        // Handle navigation, analytics, or actions
        print("Selected \(item.title)")
    }
}

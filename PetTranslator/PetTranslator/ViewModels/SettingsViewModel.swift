//
//  SettingsViewModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation

// MARK: - SettingsViewModel
/// The ViewModel for managing settings-related data and actions in the SettingsView.
final class SettingsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    /// A list of settings items to display in the Settings view.
    @Published var items: [SettingsItem] = [
        SettingsItem(title: "Rate Us"),
        SettingsItem(title: "Share App"),
        SettingsItem(title: "Contact Us"),
        SettingsItem(title: "Restore Purchases"),
        SettingsItem(title: "Privacy Policy"),
        SettingsItem(title: "Terms of Use")
    ]
}


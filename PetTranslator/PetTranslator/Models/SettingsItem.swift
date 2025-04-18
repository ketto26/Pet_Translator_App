//
//  SettingsItem.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation

// MARK: - SettingsItem
/// A model representing a settings item with an identifier and a title.
struct SettingsItem: Identifiable {
    
    // MARK: - Properties
    /// A unique identifier for each settings item.
    let id = UUID()
    
    /// The title of the settings item.
    let title: String
}

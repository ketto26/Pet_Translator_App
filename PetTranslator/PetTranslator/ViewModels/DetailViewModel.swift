//
//  DetailViewModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation

// MARK: - DetailViewModel
/// The ViewModel for managing the details of a specific setting or feature.
final class DetailViewModel: ObservableObject {
    
    // MARK: - Properties
    /// The title of the detail view, representing the specific setting or feature.
    let title: String
    
    // MARK: - Initializer
    /// Initializes a new instance of DetailViewModel with a given title.
    /// - Parameter title: The title to display in the detail view.
    init(title: String) {
        self.title = title
    }
}


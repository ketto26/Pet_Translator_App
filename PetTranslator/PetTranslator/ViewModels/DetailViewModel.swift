//
//  DetailViewModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation

final class DetailViewModel: ObservableObject {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

//
//  DetailView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 16.04.25.
//

import SwiftUI

// MARK: - DetailView

/// A simple detail screen that displays a title passed from the previous view.
struct DetailView: View {
    
    // MARK: - Properties
    let title: String

    // MARK: - Body
    var body: some View {
        ZStack{
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#F3F5F6"),
                    Color(hex: "#C9FFE0")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Display the passed title
                Text(title)
                    .font(.custom("Konkhmer Sleokchher", size: 50))
                    .padding()
                Spacer()
            }
            .foregroundColor(Color(hex: "#292D32"))
        }
    }
}


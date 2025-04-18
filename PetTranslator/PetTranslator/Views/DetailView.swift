//
//  DetailView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 16.04.25.
//

// DetailView.swift
import SwiftUI

/// A detail screen using MVVM that displays a title passed via ViewModel.
struct DetailView: View {
    
    // MARK: - ViewModel
    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        ZStack {
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
                
                Text(viewModel.title)
                    .font(.custom("Konkhmer Sleokchher", size: 50))
                    .padding()
                
                Spacer()
            }
            .foregroundColor(Color(hex: "#292D32"))
        }
    }
}

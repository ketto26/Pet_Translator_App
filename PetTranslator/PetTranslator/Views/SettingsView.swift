//
//  SettingsView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 16.04.25.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - ViewModel
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationView {
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
                    Text("Settings")
                        .font(.custom("Konkhmer Sleokchher", size: 32))
                    
                    ScrollView {
                        VStack(spacing: 14) {
                            ForEach(viewModel.items) { item in
                                NavigationLink(
                                    destination: DetailView(viewModel: DetailViewModel(title: item.title))
                                ) {
                                    HStack {
                                        Text(item.title)
                                            .font(.custom("Konkhmer Sleokchher", size: 16))
                                            .foregroundColor(Color(hex: "#292D32"))
                                            .padding(.leading, 16)
                                        
                                        Spacer()
                                        
                                        Image("navigationArrow")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .padding(.trailing, 16)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color(hex: "#D6DCFF"))
                                    .cornerRadius(20)
                                    .padding(.horizontal, 16)
                                }
                            }
                        }
                    }
                }
            }
            .foregroundColor(Color(hex: "#292D32"))
        }
    }
}


#Preview {
    SettingsView()
}

//
//  SettingsView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 16.04.25.
//

import SwiftUI

// MARK: - SettingsView

/// A view displaying a list of settings options, each leading to a detail page.
struct SettingsView: View {
    
    // MARK: - Properties
        
    /// The list of setting items to display
    let items = [
        "Rate Us",
        "Share App",
        "Contact Us",
        "Restore Purchases",
        "Privacy Policy",
        "Terms os Use"
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationView {
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
                
                // MARK: Content Stack
                VStack{
                    Text("Settings")
                        .font(.custom("Konkhmer Sleokchher", size: 32))
                    
                    // MARK: Scrollable List
                    ScrollView {
                        VStack(spacing: 14) {
                            ForEach(items, id: \.self) { item in
                                NavigationLink(destination: DetailView(title: item)) {
                                    HStack{
                                        Text(item)
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

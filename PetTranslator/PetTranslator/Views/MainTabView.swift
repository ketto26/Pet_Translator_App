//
//  MainTabView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 16.04.25.
//

import SwiftUI

// MARK: - Tab Enumeration

/// Enum to represent the selected tab in the custom tab bar
enum Tab {
    case main
    case settings
}


// MARK: - MainTabView

/// Main view that handles tab navigation and custom tab bar
struct MainTabView: View {
    // MARK: - State
    @State private var selectedTab: Tab = .main
    
    // MARK: - Body
    var body: some View {
        ZStack{
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#F3F5F6"),
                    Color(hex: "#C9FFE0")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Content Area
                ZStack {
                    switch selectedTab {
                    case .main:
                        ContentView()
                    case .settings:
                        SettingsView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // MARK: - Custom Tab Bar
                HStack {
                    Spacer()
                    
                    tabBarItem(imageName: "messages", title: "Translator", tab: .main)
                    
                    Spacer()
                    
                    tabBarItem(imageName: "Settings", title: "Clicker", tab: .settings)
                    
                    Spacer()
                }
                .padding(.vertical, 12)
                .background(Color.white)
                .frame(width:216, height: 82)
                .cornerRadius(20)
            }
            .padding(.bottom, 30)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    
    
    // MARK: - Tab Bar Item Builder
        
        /// Creates a tab bar button
        /// - Parameters:
        ///   - imageName: Image name used for the tab icon
        ///   - title: Text displayed under the icon
        ///   - tab: Associated tab enum value
        /// - Returns: A view representing a tab bar button
    private func tabBarItem(imageName: String, title: String, tab: Tab) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .opacity(selectedTab == tab ? 1.0 : 0.6)
                    .foregroundColor(.gray)
                Text(title)
                    .font(.custom("Konkhmer Sleokchher", size: 12))
                    .foregroundColor(Color(hex: "#292D32"))
                    .opacity(selectedTab == tab ? 1.0 : 0.6)
            }
        }
    }
}


#Preview {
    MainTabView()
}

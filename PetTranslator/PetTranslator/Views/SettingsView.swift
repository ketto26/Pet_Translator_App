//
//  SettingsView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 16.04.25.
//

import SwiftUI

// MARK: - SettingsView
/// A view that displays the settings screen with a list of settings items.
struct SettingsView: View {
    
    // MARK: - ViewModel
    /// The ViewModel that handles the settings logic and data.
    @StateObject private var viewModel = SettingsViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background Gradient
                /// The background gradient for the settings screen, starting from light grey to green.
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
                    // MARK: - Title
                    /// Displays the title "Settings" at the top of the screen.
                    Text("Settings")
                        .font(.custom("Konkhmer Sleokchher", size: 32))
                    
                    // MARK: - Scrollable List
                    /// A scrollable view containing the list of settings items.
                    ScrollView {
                        VStack(spacing: 14) {
                            // MARK: - Settings Item Loop
                            /// Loops through the items in the ViewModel and creates a navigation link for each.
                            ForEach(viewModel.items) { item in
                                NavigationLink(
                                    destination: DetailView(viewModel: DetailViewModel(title: item.title))
                                ) {
                                    HStack {
                                        // MARK: - Item Title
                                        /// Displays the title of the settings item.
                                        Text(item.title)
                                            .font(.custom("Konkhmer Sleokchher", size: 16))
                                            .foregroundColor(Color(hex: "#292D32"))
                                            .padding(.leading, 16)
                                        
                                        Spacer()
                                        
                                        // MARK: - Arrow Icon
                                        /// Displays an arrow icon to indicate a navigation action.
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
            // MARK: - Foreground Color
            /// Applies the main foreground color for the text and items in the view.
            .foregroundColor(Color(hex: "#292D32"))
        }
    }
}

// MARK: - Preview
/// Preview for the SettingsView.
#Preview {
    SettingsView()
}


//
//  ContentView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 15.04.25.
//

import SwiftUI
import AVFoundation

// MARK: - ContentView
/// The main view for the Pet Translator app. It displays the translation results or the input interface based on the current state.
struct ContentView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = TranslatorViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                // MARK: - Results View
                /// Displays the results view if `showingResult` is true.
                if viewModel.showingResult {
                    ResultsView(
                        showingResult: $viewModel.showingResult,
                        processingResult: $viewModel.processingResult,
                        viewModel: viewModel
                    )
                    .background(Color.clear)
                } else {
                    // MARK: - Translator Title
                    Text("Translator")
                        .font(.custom("Konkhmer Sleokchher", size: 32))
                    
                    // MARK: - Language Switcher
                    /// Toggle between Human and Pet translation.
                    HStack(spacing: 20) {
                        Text(viewModel.isSwapped ? "Human" : "Pet")
                            .font(.custom("Konkhmer Sleokchher", size: 16))
                            .frame(width: 135)
                        
                        Image("arrow-swap-horizontal")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                withAnimation { viewModel.isSwapped.toggle() }
                            }
                        
                        Text(viewModel.isSwapped ? "Pet" : "Human")
                            .font(.custom("Konkhmer Sleokchher", size: 16))
                            .frame(width: 135)
                    }
                    .padding(.top, 12)
                    
                    // MARK: - Action Cards (Microphone + Pet Selector)
                    /// Microphone card and pet selector.
                    HStack(spacing: 50) {
                        
                        // MARK: - Microphone Card
                        /// The microphone card shows the current recording state and allows the user to start/stop recording.
                        ZStack {
                            RoundedRectangle(cornerRadius: 16).fill(.white)
                            VStack(spacing: 24) {
                                Image(viewModel.isRecording ? "voice-active" : "microphone")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text(viewModel.isRecording ? "Recording..." : "Start Speak")
                                    .font(.custom("Konkhmer Sleokchher", size: 16))
                            }
                        }
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                        .frame(width: 178, height: 176)
                        .onTapGesture { viewModel.requestMicrophoneAccess() }
                        .alert("Microphone Access Denied", isPresented: $viewModel.showPermissionAlert) {
                            Button("Settings") {
                                if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                                    UIApplication.shared.open(appSettings)
                                }
                            }
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("Please allow access to your microphone to use the app’s features")
                        }
                        
                        // MARK: - Pet Selector Card
                        /// The pet selector card allows the user to choose between a cat or dog.
                        ZStack {
                            RoundedRectangle(cornerRadius: 16).fill(.white)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                            VStack(spacing: 12) {
                                ForEach(["cat", "dog"], id: \.self) { pet in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color(hex: pet == "cat" ? "#D1E7FC" : "#ECFBC7"))
                                        Image(pet)
                                            .resizable()
                                            .scaledToFit()
                                            .padding(20)
                                    }
                                    .frame(width: 70, height: 70)
                                    .opacity(viewModel.selectedPet == pet ? 1.0 : 0.6)
                                    .onTapGesture {
                                        withAnimation { viewModel.selectedPet = pet }
                                    }
                                }
                            }
                        }
                        .frame(width: 107, height: 176)
                    }
                    .padding(.top, 58)
                    .padding(.bottom, 51)
                }

                // MARK: - Pet Image Display
                /// Displays the selected pet's image.
                Image(viewModel.selectedPet)
                    .resizable()
                    .frame(width: 184, height: 184)
            }
            .foregroundColor(Color(hex: "#292D32"))
            .padding()
        }
    }
}

// MARK: - Preview
/// Preview for the ContentView.
#Preview {
    ContentView()
}

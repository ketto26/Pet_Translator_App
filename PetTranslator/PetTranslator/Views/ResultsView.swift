//
//  ResultsView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import SwiftUI

// MARK: - ResultsView
/// The view that displays the translation results, including the process of translation or the final message.
struct ResultsView: View {
    
    // MARK: - Properties
    @Binding var showingResult: Bool
    @Binding var processingResult: Bool
    @ObservedObject var viewModel: TranslatorViewModel

    // MARK: - Body
    var body: some View {
        VStack {
            
            // MARK: - Header
            /// Displays the header with a close button and title.
            HStack {
                Button(action: {
                    showingResult = false
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 48, height: 48)
                        
                        Image("Close")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                }
                
                Spacer()
                Text("Result")
                    .font(.custom("Konkhmer Sleokchher", size: 24))
                    .foregroundColor(Color(hex: "#292D32"))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)

            Spacer()
            Spacer()
            Spacer()
            Spacer()

            VStack {
                // MARK: - Processing Result
                /// Displays a processing message while the translation is being processed.
                if processingResult {
                    Text("Process of translation...")
                        .padding(.top, 150)
                        .font(.custom("Konkhmer Sleokchher", size: 16))
                        .foregroundColor(Color(hex: "#292D32"))
                        .animation(.easeInOut, value: processingResult)
                } else {
                    // MARK: - Repeat Action (if image is changed)
                    /// Displays a repeat button when the image has changed, allowing the user to generate a new message.
                    if viewModel.isImageChanged {
                        ZStack {
                            Image("repeate")
                                .resizable()
                                .frame(width: 291, height: 54)

                            HStack {
                                Image("again")
                                    .resizable()
                                    .frame(width: 16, height: 16)

                                Text("Repeat")
                                    .font(.custom("Konkhmer Sleokchher", size: 12))
                                    .foregroundColor(Color(hex: "#292D32"))
                            }
                        }
                        .padding(.bottom, 125)
                        .onTapGesture {
                            viewModel.generateNewMessage(for: viewModel.selectedPet)
                        }
                    } else {
                        // MARK: - Result Message
                        /// Displays the result message once the translation is ready.
                        resultMessageView
                    }
                }
            }
            .padding(.top, 50)
        }
        .padding(.bottom, 40)
        .background(Color.clear)
        .onAppear {
            // MARK: - OnAppear
            /// Calls the method to generate a new message when the view appears.
            viewModel.generateNewMessage(for: viewModel.selectedPet)
        }
    }

    // MARK: - Result Message View (Extracted)
    /// A reusable view that displays the result message inside a stylized box.
    private var resultMessageView: some View {
        ZStack(alignment: .top) {
            Image("ResultBox")
                .resizable()
                .frame(width: 295, height: 248)

            Text(viewModel.resultMessage)
                .font(.custom("Konkhmer Sleokchher", size: 16))
                .foregroundColor(Color(hex: "#292D32"))
                .padding(.top, 60)
                .frame(maxWidth: 285)
        }
    }
}

// MARK: - Preview
/// Preview for the ResultsView.
#Preview {
    ResultsView(showingResult: .constant(true), processingResult: .constant(false), viewModel: TranslatorViewModel())
}



//
//  ResultsView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import SwiftUI


struct ResultsView: View {
    @Binding var showingResult: Bool
    @Binding var processingResult: Bool
    var selectedPet: String

    var body: some View {
        VStack {
            // MARK: - Custom Positioned Navigation Bar
            HStack(alignment: .top) {
                Button(action: {
                    showingResult = false
                }) {
                    Image("Close")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(Color(hex: "#292D32"))
                }
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                
                Spacer()
                
                Text("Result")
                    .font(.custom("Konkhmer Sleokchher", size: 24))
                    .foregroundColor(Color(hex: "#292D32"))
                
                Spacer()
                Spacer()
            }
            .frame(width: 350, height: 150)
            .padding(.horizontal)
            .padding(.top, 0)

            // MARK: - Main Content
            VStack {
                if processingResult {
                    Text("Process of translation...")
                        .padding(.top, 150)
                        .font(.custom("Konkhmer Sleokchher", size: 16))
                        .foregroundColor(Color(hex: "#292D32"))
                        .animation(.easeInOut, value: processingResult)
                } else {
                    ZStack(alignment: .top) {
                        Image("ResultBox")
                            .resizable()
                            .frame(width: 295, height: 248)

                        Text(getRandomText(for: selectedPet))
                            .font(.custom("Konkhmer Sleokchher", size: 16))
                            .foregroundColor(Color(hex: "#292D32"))
                            .padding(.top, 60)
                            .frame(maxWidth: 285)
                    }
                }
            }
            .padding(.top, 100)
        }
    }

    // MARK: - Helpers
    func getRandomText(for pet: String) -> String {
        if pet == "dog" {
            let messages = [
                "I’m hungry, feed me!",
                "What are you doing, human?",
                "Is it walk time yet?",
                "I smelled something amazing!",
                "You’re my favorite human.",
                "Can I have that snack now?",
                "I studied barkology at Pawvard.",
                "I did not chew the slipper, I swear!",
                "Throw the ball already!",
                "Sniff sniff… smells like adventure!",
                "Cats are real or government spies?",
                "You smell like love and peanut butter."
            ]
            return messages.randomElement() ?? "Processing..."
        } else {
            let messages = [
                "I’m hungry, feed me!",
                "What are you doing, human?",
                "I was napping… what is it now?",
                "Feed me. Immediately.",
                "I knocked it down on purpose.",
                "I’m judging you.",
                "That thing you love? I chewed it.",
                "Purr activated. You're welcome.",
                "Your laptop is warm. I claim it."
            ]
            return messages.randomElement() ?? "Processing..."
        }
    }
}

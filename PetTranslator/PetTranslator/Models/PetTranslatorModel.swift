//
//  PetTranslatorModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation

// MARK: - PetTranslatorModel
/// A model to provide random translated messages for pets (dog or cat).
struct PetTranslatorModel {
    
    // MARK: - Static Methods
    /// Generates a random message based on the selected pet.
    /// - Parameter pet: A string representing the selected pet type ("dog" or "cat").
    /// - Returns: A random message for the selected pet or a default message if no messages are available.
    static func getRandomMessage(for pet: String) -> String {
        
        // MARK: - Dog Messages
        /// A list of predefined messages for dogs.
        let dogMessages = [
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
        
        // MARK: - Cat Messages
        /// A list of predefined messages for cats.
        let catMessages = [
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
        
        // MARK: - Return Random Message
        /// Selects a random message based on the pet type.
        return (pet == "dog" ? dogMessages : catMessages).randomElement() ?? "Processing..."
    }
}



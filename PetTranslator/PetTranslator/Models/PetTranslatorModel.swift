//
//  PetTranslatorModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation

struct PetTranslatorModel {
    static func getRandomMessage(for pet: String) -> String {
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
        
        return (pet == "dog" ? dogMessages : catMessages).randomElement() ?? "Processing..."
    }
}


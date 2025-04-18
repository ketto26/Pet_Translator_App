# PetTranslator

PetTranslator is a fun and interactive iOS app that translates what your pet might be thinking into a playful message. Whether you have a dog or a cat, this app uses voice input to generate a humorous translation of your pet's thoughts. The app also includes an animated interface that responds to the voice input with visual effects.

## Features

- **Voice Recording**: Record your voice using the built-in microphone to simulate a pet's "thoughts."
- **Pet Selection**: Choose between a dog or a cat to receive pet-specific translations.
- **Translation Generation**: The app generates random, fun messages that your pet might "say."
- **User Interface**: A clean, intuitive UI built with SwiftUI that features:
  - **Microphone button** for starting and stopping recordings.
  - **Pet selector** for choosing between dogs and cats.
  - **Result display** showing translated messages with playful animations.
  - **Settings** for additional options like rate us, share app, and more.

## Design

The app uses the **MVVM (Model-View-ViewModel)** design pattern to separate the logic from the user interface. The views are dynamically updated with the help of the `TranslatorViewModel`, which handles data changes, including microphone access, recording states, and generating translated messages.

The user interface is crafted with **SwiftUI**, ensuring a smooth and responsive experience. The app supports multiple views, including:
- **Content View**: Displays the main UI, including the microphone button and pet selector.
- **Results View**: Shows the translated message with an option to repeat.
- **Settings View**: Provides app settings and additional user options.

## Requirements

- iOS 14.0 or later
- Swift 5.0+
- Xcode 12.0+

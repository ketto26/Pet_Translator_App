//
//  TranslatorViewModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation
import AVFoundation
import SwiftUI

// MARK: - TranslatorViewModel
/// The ViewModel responsible for handling the translation logic, audio recording, and permission management.
@MainActor
class TranslatorViewModel: ObservableObject {
    
    // MARK: - Published Properties
    /// A boolean indicating if the pet and human languages are swapped.
    @Published var isSwapped = false
    
    /// The currently selected pet (either "dog" or "cat").
    @Published var selectedPet: String = "dog"
    
    /// A boolean indicating whether the app has permission to access the microphone.
    @Published var hasMicrophonePermission = false
    
    /// A boolean that determines whether to show the microphone permission alert.
    @Published var showPermissionAlert = false
    
    /// A boolean indicating whether the app is currently recording audio.
    @Published var isRecording = false
    
    /// A boolean indicating whether the result screen should be displayed.
    @Published var showingResult = false
    
    /// A boolean indicating whether the result is still being processed.
    @Published var processingResult = false
    
    /// The message to display as the result of the translation.
    @Published var resultMessage: String = ""
    
    /// A boolean indicating whether the image related to the result should change.
    @Published var isImageChanged: Bool = false
    
    /// The audio recorder used for recording voice messages.
    var audioRecorder: AVAudioRecorder?
    
    // MARK: - Recording Logic
    /// Toggles the recording state (start/stop recording) and shows the result.
    func toggleRecording() {
        if isRecording {
            audioRecorder?.stop()
            isRecording = false
            showingResult = true
            showTemporaryMessage()
        } else {
            startRecording()
        }
    }
    
    /// Starts the audio recording process.
    func startRecording() {
        let audioFilename = FileManager.default.temporaryDirectory.appendingPathComponent("recording.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
            isRecording = true
        } catch {
            print("Failed to start recording:", error)
        }
    }

    // MARK: - Microphone Permission
    /// Requests microphone access and handles the permission status.
    func requestMicrophoneAccess() {
        if #available(iOS 17, *) {
            AVAudioApplication.requestRecordPermission { [weak self] granted in
                Task { @MainActor in
                    self?.hasMicrophonePermission = granted
                    if granted {
                        self?.toggleRecording()
                    } else {
                        self?.showPermissionAlert = true
                    }
                }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission { [weak self] granted in
                Task { @MainActor in
                    self?.hasMicrophonePermission = granted
                    if granted {
                        self?.toggleRecording()
                    } else {
                        self?.showPermissionAlert = true
                    }
                }
            }
        }
    }
    
    // MARK: - Result Handling
    /// Shows a temporary message while the result is being processed.
    func showTemporaryMessage() {
        processingResult = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.processingResult = false
        }
    }
    
    /// Generates a new translation message based on the selected pet.
    func generateNewMessage(for pet: String) {
        resultMessage = PetTranslatorModel.getRandomMessage(for: pet)
        isImageChanged = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            withAnimation {
                self.isImageChanged = true
            }
        }
    }
}

// MARK: - Preview
/// Preview for TranslatorViewModel (used for SwiftUI previews).
#Preview {
    TranslatorViewModel() as! any View
}


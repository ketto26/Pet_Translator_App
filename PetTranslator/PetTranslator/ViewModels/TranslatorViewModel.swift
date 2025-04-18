//
//  TranslatorViewModel.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 18.04.25.
//

import Foundation
import AVFoundation
import SwiftUI

@MainActor
class TranslatorViewModel: ObservableObject {
    @Published var isSwapped = false
    @Published var selectedPet: String = "dog"
    @Published var hasMicrophonePermission = false
    @Published var showPermissionAlert = false
    @Published var isRecording = false
    @Published var showingResult = false
    @Published var processingResult = false
    
    var audioRecorder: AVAudioRecorder?
    
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
    
    func showTemporaryMessage() {
        processingResult = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.processingResult = false
        }
    }
}

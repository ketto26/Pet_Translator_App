//
//  ContentView.swift
//  PetTranslator
//
//  Created by Keto Nioradze on 15.04.25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - State Properties
    @State private var isSwapped = false
    @State private var selectedPet: String? = "dog"
    
    // MARK: - Body
    var body: some View {
        ZStack{
            // MARK: - Background
            
            
            // MARK: - Main Content
            VStack {
                // MARK: - Title
                Text("Translator")
                    .font(.custom("Konkhmer Sleokchher", size: 32))
                    
                
                // MARK: - Language Switcher
                HStack(spacing: 20){
                    if isSwapped {
                        Text("Human")
                            .font(.custom("Konkhmer Sleokchher", size: 16))
                        
                        Image("arrow-swap-horizontal")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                withAnimation{
                                    isSwapped.toggle()
                                }
                            }
                        
                        Text("Pet")
                            .font(.custom("Konkhmer Sleokchher", size: 16))
                    } else {
                        Text("Pet")
                            .font(.custom("Konkhmer Sleokchher", size: 16))
                        
                        Image("arrow-swap-horizontal")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                withAnimation{
                                    isSwapped.toggle()
                                }
                            }
                        
                        Text("Human")
                            .font(.custom("Konkhmer Sleokchher", size: 16))
                        
                    }
                }
                .padding(.top, 12)
                
                // MARK: - Action Cards
                HStack(spacing: 50){
                    
                    // MARK: - Microphone Card
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                        
                        
                        VStack(spacing: 24){
                            Image("microphone")
                                .resizable()
                                .frame(width: 70, height: 70)
                            
                            Text("Start Speak")
                                .font(.custom("Konkhmer Sleokchher", size: 16))
                        }
                    }
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                    .frame(width: 178, height: 176)
                    
                    // MARK: - Pet Selector Card
                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        
                        VStack(spacing: 12){
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(hex: "#D1E7FC"))
                                
                                Image("cat")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(20)
                                
                            }
                            .frame(width: 70, height: 70)
                            .opacity(selectedPet == "cat" ? 1.0 : 0.6)
                            .onTapGesture {
                                withAnimation {
                                    selectedPet = "cat"
                                }
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(hex: "#ECFBC7"))
                                
                                Image("dog")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(20)
                                
                            }
                            .frame(width: 70, height: 70)
                            .opacity(selectedPet == "dog" ? 1.0 : 0.6)
                            .onTapGesture {
                                withAnimation {
                                    selectedPet = "dog"
                                }
                            }
                        }
                    }
                    .frame(width: 107, height: 176)
                }
                .padding(.top, 58)
                .padding(.bottom, 51)
                
                // MARK: - Pet Image
                if selectedPet == "dog" {
                    Image("dog")
                        .resizable()
                        .frame(width: 184, height: 184)
                } else {
                    Image("cat")
                        .resizable()
                        .frame(width: 184, height: 184)
                }
                
            }
            .foregroundColor(Color(hex: "#292D32"))
            .padding()
            
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}

//
//  ContentView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 15/10/2024.
// why wont this commit what

import SwiftUI


struct ContentView: View {
    
    @AppStorage("number") var storedPrayerNumber = 10
    
    
    @State var prayerNumber = 0
    @State private var showDaily = true
    
    @AppStorage("isOnBoarding") var isOnBoarding = true
    
    
    @StateObject var prayerManager = PrayerManager()
    
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some View {
        
        TabView {
            
            
            PrayerDetailView(prayerManager: prayerManager, prayerNumber: $storedPrayerNumber, prayer: $prayerManager.allPrayers.first(where: { $0.id == storedPrayerNumber }) ?? .constant(Prayer(id: 0, text1: "", text2: "", text3: "")), inSheet: true, personal: (storedPrayerNumber > 89) )

                .tabItem {
                    Label("Daily", systemImage: "sun.max.fill")
                }
                .onShake {
                    storedPrayerNumber = Int.random(in: 0..<prayerManager.allPrayers.count)
                }
                
            
          
               
            
            MainPrayerView(prayerNumber: $prayerNumber, prayerManager: prayerManager)
                .tabItem {
                    Label("All Prayers", systemImage: "doc.plaintext")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "questionmark.circle.fill")
                }
           
            
        }
        .sheet(isPresented: $isOnBoarding) {
            TitleView()
        }
        
//        .sheet(isPresented: $showDaily) {
//           
//            PrayerDetailView(prayerManager: prayerManager, prayerNumber: $storedPrayerNumber, prayer: $prayerManager.prayers.first(where: { $0.id == storedPrayerNumber }) ?? $prayerManager.prayers[0], inSheet: true)
//                .onDisappear {
//                  
//                        if storedPrayerNumber + 1 >= prayerManager.prayers.count {
//                            storedPrayerNumber = 0
//                        } else {
//                            storedPrayerNumber += 1
//                        }
//                        
//                    
//                }
//           
//        }
        
        .onChange(of: scenePhase) { oldPhase, newPhase in
            if newPhase == .background {
               
                    if storedPrayerNumber + 1 >= prayerManager.prayers.count - 1 {
                        storedPrayerNumber = 0
                    } else {
                        storedPrayerNumber += 1
                    }
                
                print(prayerManager.prayers)
                    
                
            }
        }
        
        .onAppear {
           
        }
        
        
    }
    
    
}

#Preview {
    ContentView()
}

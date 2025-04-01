//
//  ContentView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 15/10/2024.
// why wont this commit what

import SwiftUI


struct ContentView: View {
    
    @AppStorage("number") var storedPrayerNumber = 4
    
    
    @State var prayerNumber = 0
    @State private var showDaily = true
    
    @AppStorage("isOnBoarding") var isOnBoarding = true
    
    
    @StateObject var prayerManager = PrayerManager()
    
   
    
    
    @Environment(\.scenePhase) var scenePhase
    
    
    var body: some View {
        
        
        
        TabView {
            MainPrayerView(prayerNumber: $prayerNumber, prayerManager: prayerManager)
                .tabItem {
                    Label("Prayers", systemImage: "doc.plaintext")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "questionmark.circle.fill")
                }
            
        }
        .sheet(isPresented: $isOnBoarding) {
            TitleView()
        }
        
        .sheet(isPresented: $showDaily) {
           
            PrayerDetailView(prayerManager: prayerManager, prayerNumber: $storedPrayerNumber, prayer: $prayerManager.prayers.first(where: { $0.id == storedPrayerNumber }) ?? $prayerManager.prayers[0], inSheet: true)
                .onDisappear {
                  
                        if storedPrayerNumber + 1 >= prayerManager.prayers.count {
                            storedPrayerNumber = 0
                        } else {
                            storedPrayerNumber += 1
                        }
                        
                    
                }
            Text("(Swipe down to view more prayers)")
                .font(.footnote)
        }
        
        .onChange(of: scenePhase) { oldPhase, newPhase in
            if newPhase == .background {
               
                    if storedPrayerNumber + 1 >= prayerManager.prayers.count - 1 {
                        storedPrayerNumber = 0
                    } else {
                        storedPrayerNumber += 1
                    }
                    
                
            }
        }
        
        .onAppear {
           
        }
        
        
    }
    
    
}

#Preview {
    ContentView()
}

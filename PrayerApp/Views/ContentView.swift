//
//  ContentView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 15/10/2024.
// why wont this commit what 

import SwiftUI


struct ContentView: View {
    
   // @AppStorage("number") var prayerNumber = 0
    
  

    @StateObject var prayerManager = PrayerManager()
    
    var body: some View {
      
    
        TabView {
            MainPrayerView(prayerManager: prayerManager)
                       .tabItem {
                           Label("Prayers", systemImage: "doc.plaintext")
                       }
            AboutView()
                       .tabItem {
                           Label("About", systemImage: "questionmark.circle.fill")
                       }
                 
               }

       
       
    }
}

#Preview {
    ContentView()
}

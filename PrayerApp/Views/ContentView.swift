//
//  ContentView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 15/10/2024.
// why wont this commit what 

import SwiftUI


struct ContentView: View {
    
    @State private var prayers = [
        Prayer(id: 1, text1: "reading title", text2: "text2", text3: "text3"),
        Prayer(id: 2, text1: "reading title2", text2: "text2", text3: "text3")
    ]

    
    var body: some View {
        NavigationStack {
            List($prayers) { $prayer in
                NavigationLink {
                    PrayerDetailView(prayer: $prayer)
                } label: {
                    Text(prayer.text1)
                }
            }
            .navigationTitle("Prayers")
        }
    
       
       
    }
}

#Preview {
    ContentView()
}

//
//  MainPrayerView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 01/04/2025.
// note: prayer id starts from 0. id displayed is 1 more than actual id so it looks better

import SwiftUI

struct MainPrayerView: View {
    
    
    @ObservedObject var prayerManager : PrayerManager
    var body: some View {
        NavigationStack {
            List {
                ForEach($prayerManager.prayers.sorted(by: {$0.id < $1.id})) { $prayer in
                NavigationLink {
                    PrayerDetailView(prayer: $prayer)
                    
                } label: {
                    Text("Prayer \(prayer.id + 1 )")
                }
            }
                
            .navigationTitle("Prayers")
            }
        }
        
    }
}

#Preview {
    MainPrayerView(prayerManager: PrayerManager())
}

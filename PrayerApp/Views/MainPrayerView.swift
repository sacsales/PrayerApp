//
//  MainPrayerView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 01/04/2025.
// note: prayer id starts from 0. id displayed is 1 more than actual id so it looks better

import SwiftUI

struct MainPrayerView: View {
    
    @Binding var prayerNumber : Int
    
    @State private var showAddSheet = false
    
    @ObservedObject var prayerManager : PrayerManager
    var body: some View {
        NavigationStack {
            List {
                
                    
                    Section ("Personal Prayers") {
                        ForEach($prayerManager.personalPrayers.sorted(by: {$0.id < $1.id})) { $prayer in
                            NavigationLink {
                                PrayerDetailView(prayerManager: prayerManager, prayerNumber: $prayer.id, prayer: $prayer, inSheet: false, personal: true)
                                
                            } label: {
                                Text("Personal Prayer \(prayer.personal_id + 1 )")
                            }
                        }
                        .onDelete(perform: deleteItem)
                        
                        
                    }
                
                Section ("Lola Mercy's Prayers") {
                    
                    ForEach($prayerManager.prayers.sorted(by: {$0.id < $1.id})) { $prayer in
                        NavigationLink {
                            PrayerDetailView(prayerManager: prayerManager, prayerNumber: $prayer.id, prayer: $prayer, inSheet: false, personal: false)
                            
                        } label: {
                            Text("Prayer \(prayer.id + 1 )")
                        }
                    }
                   
                    
                    
                    
                }
                
                
                
                
                
            }
            
            
            .navigationTitle("All Prayers")
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                       
                        showAddSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showAddSheet) {
                   
            AddNewPrayer(prayerManager: prayerManager)
                }
        
        
    }
      
    
    private func deleteItem(at offsets: IndexSet) {
        prayerManager.personalPrayers.remove(atOffsets: offsets)
     }
        
}

#Preview {
    MainPrayerView(prayerNumber: .constant(0), prayerManager: PrayerManager())
}

//
//  PrayerDetailView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 19/10/2024.
//

import SwiftUI

struct PrayerDetailView: View {
    
    @Binding var prayer: Prayer
    
    var body: some View {
        VStack {
            Text(prayer.text1)
            Text(prayer.text2)
            Text(prayer.text3)
        }
            
    }
}

#Preview {
    PrayerDetailView(prayer: .constant(Prayer(id: 1, text1: "reading title", text2: "reading", text3: "response")))
}

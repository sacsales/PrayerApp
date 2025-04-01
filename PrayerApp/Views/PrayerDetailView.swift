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
        ScrollView {
            VStack (alignment: .leading) {
                Text("Today's Prayer")
                    .bold()
                    .font(.largeTitle)
                Text("(Prayer \(prayer.id + 1))")
                    .bold()
                   
                    .font(.title3)
                Text("""
 
 **Father or Mother:**
 In the name of the Father, of the Son and of the Holy Spirit. Amen.
 
 **A reading from \(prayer.text1).** \(prayer.text2)
 
 _(Pause for a few moments of reflection)_
 
 **One of the Children:**
 \(prayer.text3)
 
 **Together:** In the name of the Father, of the Son, and of the Holy Spirit. Amen.
 
 """)
                
                
            }
            .padding()
            
        }
    }
}

#Preview {
    PrayerDetailView(prayer: .constant(Prayer(id: 1, text1: "Psalm 104: 14-15", text2: "You make grass grow for the cattle and plants for man to use, so that he can grow his crops and produce wine to make him happy, olive oil to make him cheerful and bread to give him strength.", text3: "Father of all creation, we thank you for all the gifts you lavish upon us every day. Bless those whose work produces what we eat and drink. Help us live in peace.")))
}

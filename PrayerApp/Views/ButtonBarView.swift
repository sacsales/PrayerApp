//
//  ButtonBarView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 01/04/2025.
//

import SwiftUI

struct ButtonBarView: View {
    
    
    @ObservedObject var prayerManager: PrayerManager
    
    @Binding var numberToChange: Int
    
    var body: some View {
        HStack {
            Button {
                if numberToChange - 1 < 0 {
                    numberToChange = prayerManager.prayers.count - 1
                } else {
                    numberToChange -= 1
                }
            } label: {
               
                Image(systemName: "arrow.left")
                Text("Previous")
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Button {
                if numberToChange + 1 > prayerManager.prayers.count - 1 {
                    numberToChange = 0
                } else {
                    numberToChange += 1
                }
            } label: {
                Text("Next")
                Image(systemName: "arrow.right")
            }
            .buttonStyle(.borderedProminent)
        }
        .bold()
        .tint(.orange)
        .padding()
    }
}

#Preview {
    ButtonBarView(prayerManager: PrayerManager(), numberToChange: .constant(0))
}

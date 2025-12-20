//
//  AddNewPrayer.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 20/12/2025.
//

import SwiftUI

struct AddNewPrayer: View {
    
    
    @ObservedObject var prayerManager : PrayerManager
    
    @Environment(\.dismiss) var goAway
    
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("New Prayer")
                    .font(Font.largeTitle)
                    .bold()
                    .padding(.bottom)
                Spacer()
                Image("sayGraceLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
            }
                
            Text("Head of the Family:")
                .bold()
            Text("In the name of the Father, of the Son and of the Holy Spirit. Amen.")
                .padding(.bottom)
            TextField("A reading from...", text: $text1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Scripture Text", text: $text2, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)
            Text("(Pause for a few moments of reflection)")
                .padding(.bottom)
                .italic()
            Text("Family Member:")
                .bold()
            TextField("Reflection", text: $text3, axis: .vertical)
                .padding(.bottom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("**Together:** In the name of the Father, of the Son and of the Holy Spirit. Amen.")
                
            
            Button("Save"){
                
                print("ID ADDED IS \(prayerManager.allPrayers.count)")
                print("PERSONAL ID ADDED IS \(prayerManager.personalPrayers.count)")
                
               
                prayerManager.personalPrayers.append(Prayer(id: prayerManager.allPrayers.count, text1: text1, text2: text2, text3: text3, personal: true, personal_id: prayerManager.personalPrayers.count))
                
                
                prayerManager.load()
                print(prayerManager.allPrayers.count)
                
                print("saved")
                text1 = ""
                text2 = ""
                text3 = ""
                goAway()
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
                
        }
        .padding()
    }
}

#Preview {
    AddNewPrayer(prayerManager: PrayerManager())
}

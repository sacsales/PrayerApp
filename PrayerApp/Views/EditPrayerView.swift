//
//  EditPrayerView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 20/12/2025.
//

import SwiftUI

struct EditPrayerView: View {
    
    
    @Binding var prayer: Prayer
    
    @ObservedObject var prayerManager : PrayerManager
    
    @Environment(\.dismiss) var goAway
    
  
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                HStack {
                    Text("Edit Prayer")
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
                TextField("A reading from...", text: $prayer.text1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Scripture Text", text:  $prayer.text2, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                Text("(Pause for a few moments of reflection)")
                    .padding(.bottom)
                    .italic()
                Text("Family Member:")
                    .bold()
                TextField("Reflection", text:  $prayer.text3, axis: .vertical)
                    .padding(.bottom)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("**Together:** In the name of the Father, of the Son and of the Holy Spirit. Amen.")
                    .padding(.bottom)
                
                
                Button("Save"){
                    //                prayerManager.personalPrayers.append(Prayer(id: prayerManager.personalPrayers.count, text1: text1, text2: text2, text3: text3))
                    //                print(prayerManager.personalPrayers)
                    print("saved")
                    
                    goAway()
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
            }
            .padding()
        }
    }
}

#Preview {
    EditPrayerView(prayer: .constant(Prayer(id: 0, text1: "text1", text2: "text2", text3: "text3")), prayerManager: PrayerManager())
}

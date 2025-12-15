//
//  PrayerDetailView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 19/10/2024.
//

import SwiftUI

struct PrayerDetailView: View {
    
    
    @ObservedObject var prayerManager : PrayerManager
    
    @Binding var prayerNumber : Int
    
    @Binding var prayer: Prayer
    
    @State var inSheet : Bool
    
    @Environment(\.dismiss) var goAway
    
    var body: some View {
        NavigationView {
            
            VStack {
//                if inSheet {
//                    ButtonBarView(prayerManager: prayerManager, numberToChange: $prayerNumber)
//                }
                
                
                ScrollView {
                    VStack (alignment: .leading) {
                        
                        //                    if inSheet {
                        //                        ButtonBarView(prayerManager: prayerManager, numberToChange: $prayerNumber)
                        //                    }
                        HStack {
                            VStack (alignment: .leading){
                                Text("Today's Prayer              ")
                                    .bold()
                                    .font(.largeTitle)
                                Text("(Prayer \(prayer.id + 1))      ")
                                    .bold()
                            }
                            
                            Spacer()
                            Image("sayGraceLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                        }
                        
                        .font(.title3)
                        Text("""
 
 **Head of the Family:**
 In the name of the Father, of the Son and of the Holy Spirit. Amen.
 
 **A reading from \(prayer.text1).** \(prayer.text2)
 
 _(Pause for a few moments of reflection)_
 
 **Family Member:**
 \(prayer.text3)
 
 **Together:** In the name of the Father, of the Son, and of the Holy Spirit. Amen.
 
 """)
                        
                        //                    Button {
                        //                        goAway()
                        //                    } label: {
                        //                        Text("Dismiss")
                        //                    }
                        //                    .buttonStyle(.borderedProminent)
                        //                    .tint(.orange)
                        //
                        
                        
                        Spacer()
                        
                        
                        
                        
                        
                    }
                    .padding()
                    .toolbar {
                        
                        if inSheet {
                            
                            ToolbarItem (placement: .topBarLeading) {
                                Button {
                                    if prayerNumber - 1 < 0 {
                                        prayerNumber = prayerManager.prayers.count - 1
                                    } else {
                                        prayerNumber -= 1
                                    }
                                } label: {
                                    
                                    Image(systemName: "arrow.left")
                                        
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.orange)
                            }
                            
                            ToolbarItem {
                                Button {
                                    if prayerNumber + 1 > prayerManager.prayers.count - 1 {
                                        prayerNumber = 0
                                    } else {
                                        prayerNumber += 1
                                    }
                                } label: {
                                    Image(systemName: "arrow.right")
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.orange)
                            }
                        }
                    }
                    
                }
                
                
            }
        }
        
    }
}

#Preview {
    PrayerDetailView(prayerManager: PrayerManager(), prayerNumber: .constant(0), prayer: .constant(Prayer(id: 1, text1: "text1", text2: "text2", text3: "text3")), inSheet: true)
}





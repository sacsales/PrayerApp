//
//  TitleView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 01/04/2025.
//

import SwiftUI

struct TitleView: View {
    
    @AppStorage("isOnBoarding") var isOnBoarding: Bool = true
    
    
    var body: some View {
        ZStack {
            Image("SayGraceNoTitle")
                .resizable()
                .scaledToFill()
            VStack (alignment: .center){
                VStack {
                    Text("Say Grace")
                        .font(.system(size: 60))
                    Text("Prayers of Grace and Mercy")
                        .font(.system(size: 25))
                        
                }
                .bold()
                .padding()
                .foregroundStyle(.brown)
                Button("Start") {
                    isOnBoarding = false
                }
               
                .buttonStyle(.borderedProminent)
                .bold()
                .tint(.orange)
            }
        }
        .background(.white)
    }
}

#Preview {
    TitleView()
}

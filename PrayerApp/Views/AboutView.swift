//
//  AboutView.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 01/04/2025.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("About")
                    .bold()
                    .font(.largeTitle)
                Text("""

“A family that prays together stays together” - My Lola Mercy believed this wholeheartedly.

Mealtimes were a special time at our household. Lola Mercy showed her love for us through the food she lovingly prepared and set on our table. Each meal would begin with a short prayer of thanks aided by a set of prayer cards she picked up at a charity bazaar many years ago. 

The same prayers are found here to honor my Lola Mercy’s memory. It comes with the hope that the practice of saying grace will bring families closer no matter where they may be. 

May God bless your family, bring you closer together, and make you a blessing to everyone you meet.

    - Sabrina Angeline Cedo Sales




""")
            }
        }
        .padding()
        
    }
}

#Preview {
    AboutView()
}

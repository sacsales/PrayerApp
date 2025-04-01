//
//  PrayerManager.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 19/10/2024.
//

import Foundation


import SwiftUI


class PrayerManager: ObservableObject {
    @Published var prayers: [Prayer] = [] {
        didSet {
            save()
        }
    }
    init() {
        load()
        
    }
    func getArchiveURL() -> URL {
        let plistName = "prayers.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName)
    }
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedPrayers = try? propertyListEncoder.encode(prayers)
        try? encodedPrayers?.write(to: archiveURL, options: .noFileProtection)
    }
    func load() {
      //  prayers = Prayer.samplePrayers
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedPrayerData = try? Data(contentsOf: archiveURL),
           let prayersDecoded = try? propertyListDecoder.decode([Prayer].self, from: retrievedPrayerData) {
            prayers = prayersDecoded
        }
    }
}

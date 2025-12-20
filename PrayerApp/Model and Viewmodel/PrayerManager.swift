//
//  PrayerManager.swift
//  PrayerApp
//
//  Created by Sabrina C. Sales on 19/10/2024.
//

import Foundation


import SwiftUI



class PrayerManager: ObservableObject {
    
    //defaults
    @Published var prayers: [Prayer] = [] {
        didSet {
            save()
        }
    }
    
    //added
    @Published var personalPrayers: [Prayer] = [] {
        didSet {
            save()
        }
    }
    
    //everything
    @Published var allPrayers: [Prayer] = [] {
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
        let encodedPrayers = try? propertyListEncoder.encode(personalPrayers)
        try? encodedPrayers?.write(to: archiveURL, options: .noFileProtection)
    }
    func load() {
       
//        var idTracker = 0
//        var allPrayers = allPrayersMessy.map { prayer in
//            Prayer(id: idTracker, text1: prayer.text1, text2: prayer.text2, text3: prayer.text3, personal: prayer.personal)
//            idTracker += 1
//        }
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedPrayerData = try? Data(contentsOf: archiveURL),
           let prayersDecoded = try? propertyListDecoder.decode([Prayer].self, from: retrievedPrayerData) {
            personalPrayers = prayersDecoded
            allPrayers = defaultPrayers + personalPrayers
        }
        
        prayers = defaultPrayers

    }
}

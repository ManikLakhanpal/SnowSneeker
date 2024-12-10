//
//  Favourites.swift
//  SnowSneeker
//
//  Created by Manik Lakhanpal on 10/12/24.
//

import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    
    private let key = "Favorites"
    
    init() {
        resorts = Set(UserDefaults.standard.stringArray(forKey: key) ?? [])
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(resorts), forKey: key)
    }
}

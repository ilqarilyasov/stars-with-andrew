//
//  StarController.swift
//  Stars-with-Andrew
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class StarController {
    
    // MARK: - Properties
    
    private(set) var stars = [Star]()
    
    // MARK: -CRUD methods
    
    func createStar(withName name: String, distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
    }
    
    // MARK: - Persistance
    
    func saveToPersistenceStore() {
        guard let url = persistenceFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        
    }
    
    private var persistenceFileURL: URL? {
        let fm = FileManager.default
        guard let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentsDir.appendingPathComponent("stars.plist")
    }
}

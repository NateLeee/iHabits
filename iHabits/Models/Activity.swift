//
//  Activity.swift
//  iHabits
//
//  Created by Nate Lee on 7/18/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String?
    var completedTimes: Int
}

class ActivitiesArray: ObservableObject {
    @Published var activities: [Activity] {
        didSet {
            let jsonEncoder = JSONEncoder()
            let encoded = try? jsonEncoder.encode(activities)
            UserDefaults.standard.set(encoded, forKey: "ActivitiesArray")
        }
    }
    
    init() {
        // Try to decode from UserDefaults
        let jsonDecoder = JSONDecoder()
        
        guard let data =  UserDefaults.standard.data(forKey: "ActivitiesArray") else {
            activities = [Activity]()
            return
        }
        
        guard let decoded = try? jsonDecoder.decode([Activity].self, from: data) else {
            activities = [Activity]()
            return
        }
        
        activities = decoded
    }
}

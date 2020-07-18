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
    var completedTimes: Int
}

class ActivitiesArray: ObservableObject {
    @Published var activities: [Activity] = [Activity]()
}

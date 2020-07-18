//
//  Activity.swift
//  iHabits
//
//  Created by Nate Lee on 7/18/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import Foundation

struct Activity: Codable {
    var name: String
    var completedTimes: Int
}

class ActivitiesArray {
    var activities: [Activity] = [Activity]()
}

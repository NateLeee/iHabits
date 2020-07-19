//
//  DetailView.swift
//  iHabits
//
//  Created by Nate Lee on 7/19/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    // @ObservedObject var activitiesArray: ActivitiesArray
    var activity: Activity
    
    var body: some View {
        Text(activity.name)
    }
}


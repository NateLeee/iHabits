//
//  DetailView.swift
//  iHabits
//
//  Created by Nate Lee on 7/19/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var activitiesArray: ActivitiesArray
    var activity: Activity
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 9) {
                    Text("Activity Name: \(activity.name)")
                        .font(.title)
                    
                    Text("Activity Description: \(activity.description ?? "No Description")")
                        .font(.body)
                    
                    Text("Completed Times: \(activitiesArray.currentActivity!.completedTimes)")
                        .layoutPriority(1)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 45)
            
            Spacer()
            
            Button(action: {
                self.activitiesArray.currentActivity!.completedTimes += 1
                
            }) {
                Text("\(self.activity.completedTimes == 0 ? "Complete" : "Complete Again🍻")")
                    .padding()
                    .layoutPriority(1)
                    .foregroundColor(.primary)
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.secondary, lineWidth: 1))
            }
            
            Spacer()
        }
        .navigationBarTitle("\(self.activity.name) Details", displayMode: .inline)
    }
    
    init(_ activitiesArray: ActivitiesArray, _ activity: Activity) {
        self.activitiesArray = activitiesArray
        self.activity = activity
        self.activitiesArray.currentActivity = activity
    }
}


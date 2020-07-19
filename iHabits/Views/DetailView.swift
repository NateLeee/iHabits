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
    var index: Int
    
    var currentActivity: Activity {
        get {
            activitiesArray.activities[index]
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(currentActivity.name)
                        .font(.largeTitle)
                    
                    Text("Completed Times: \(currentActivity.completedTimes)")
                        .font(.callout)
                        .layoutPriority(1)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 45)
            
            Spacer()
            
            Button(action: {
                self.activitiesArray.activities[self.index].completedTimes += 1
            }) {
                Text("\(currentActivity.completedTimes == 0 ? "I Completed It!" : "I Completed It Again🍻")")
            }
            
            Spacer()
        }
        .navigationBarTitle("\(currentActivity.name) Details", displayMode: .inline)
    }
}


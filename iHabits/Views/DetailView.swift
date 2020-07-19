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
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 9) {
                    Text("Activity Name: \(self.activitiesArray.activities.getElement(at: index)?.name ?? "")")
                        .font(.title)
                    
                    Text("Activity Description: \(self.activitiesArray.activities.getElement(at: index)?.description ?? "No Description")")
                        .font(.body)
                    
                    Text("Completed Times: \(self.activitiesArray.activities.getElement(at: index)?.completedTimes ?? -1)")
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
                Text("\(self.activitiesArray.activities.getElement(at: index)?.completedTimes == 0 ? "Complete" : "Complete Again🍻")")
                    .padding()
                    .layoutPriority(1)
                    .foregroundColor(.primary)
                    .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.secondary, lineWidth: 1))
            }
            
            Spacer()
        }
        .navigationBarTitle("\(self.activitiesArray.activities.getElement(at: index)?.name ?? "N/A") Details", displayMode: .inline)
    }
    
}


extension Array {
    func getElement(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}

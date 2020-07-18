//
//  SheetView.swift
//  iHabits
//
//  Created by Nate Lee on 7/18/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activitiesArray: ActivitiesArray
    
    @State private var activityName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Activity Name")) {
                    TextField("e.g. Play Video Games...", text: $activityName)
                }
                
                Button(action: {
                    // Create an Activity instance and add it to the array!
                    let newActivity = Activity(name: self.activityName, completedTimes: 0)
                    self.activitiesArray.activities.append(newActivity)
                    
                    // Dismiss the sheet
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                }
            }
            .navigationBarTitle("Add An Activity Here", displayMode: .inline)
        }
    }
}


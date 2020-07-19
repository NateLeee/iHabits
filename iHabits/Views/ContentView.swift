//
//  ContentView.swift
//  iHabits
//
//  Created by Nate Lee on 7/18/20.
//  Copyright © 2020 Nate Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activitiesArray = ActivitiesArray()
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activitiesArray.activities) { activity in
                    NavigationLink(destination: DetailView(activity: activity)) {
                        Text(activity.name)
                    }
                }
                .onDelete { (indexSet) in
                    self.deleteActivity(indexSet)
                    
                }
            }
            .navigationBarTitle("iHabits")
            .navigationBarItems(trailing: Button(action: {
                // Bring up the adding sheet
                self.showingSheet.toggle()
                
            }, label: {
                Image(systemName: "plus")
            }))
                .sheet(isPresented: $showingSheet) {
                    SheetView(activitiesArray: self.activitiesArray)
            }
        }
    }
    
    func deleteActivity(_ indexSet: IndexSet) {
        activitiesArray.activities.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

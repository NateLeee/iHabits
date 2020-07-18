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
            List(activitiesArray.activities) { activity in
                Text(activity.name)
            }
            .navigationBarTitle("iHabits")
            .navigationBarItems(trailing: Button(action: {
                // TODO: - Make it happen
                // Bring up the adding sheet
                self.showingSheet.toggle()
                
            }, label: {
                Image(systemName: "plus")
            }))
                .sheet(isPresented: $showingSheet) {
                    Text("Sheet View!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

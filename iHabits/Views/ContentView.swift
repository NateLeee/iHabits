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
                ForEach(0 ..< activitiesArray.activities.count, id: \.self) { index in
                    
                    //ForEach(activitiesArray.activities) { activity in
                    NavigationLink(destination: DetailView(activitiesArray: self.activitiesArray, index: index)) {
                        Text(self.activitiesArray.activities[index].name)
                        
                        Spacer()
                        
                        Text("Completion: \(self.activitiesArray.activities[index].completedTimes)")
                        //.font(.custom("Courier New", size: 12))
                    }
                }
                .onDelete { (indexSet) in
                    self.deleteActivity(indexSet)
                }
            }
            .navigationBarTitle("iHabits")
            .navigationBarItems(leading: activitiesArray.activities.count > 0 ? EditButton() : nil
                , trailing: Button(action: {
                    // Bring up the adding sheet
                    self.showingSheet.toggle()
                    
                }, label: {
                    Image(systemName: "plus")
                    //.scaleEffect(1.5)
                }))
                .sheet(isPresented: $showingSheet) {
                    SheetView(activitiesArray: self.activitiesArray)
            }
        }
    }
    
    private func deleteActivity(_ indexSet: IndexSet) {
        activitiesArray.activities.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

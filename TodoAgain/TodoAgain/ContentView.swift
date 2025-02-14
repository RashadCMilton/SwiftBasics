//
//  ContentView.swift
//  TodoAgain
//
//  Created by Rashad Milton on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TaskListView()  // Add TaskListView as part of ContentView
                .navigationTitle("Task Manager")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

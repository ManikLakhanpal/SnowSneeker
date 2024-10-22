//
//  ContentView.swift
//  SnowSneeker
//
//  Created by Manik Lakhanpal on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Primary") {
                Text("New view")
            }
            
            NavigationLink("Manik") {
                Text("Lakhanpal")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}

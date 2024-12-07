//
//  ContentView.swift
//  SnowSneeker
//
//  Created by Manik Lakhanpal on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
            if searchText.isEmpty {
                allNames
            } else {
                allNames.filter { $0.localizedStandardContains(searchText) }
            }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Looking for something?")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    ContentView()
}

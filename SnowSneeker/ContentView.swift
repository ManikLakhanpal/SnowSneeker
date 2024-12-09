//
//  ContentView.swift
//  SnowSneeker
//
//  Created by Manik Lakhanpal on 22/10/24.
//

import SwiftUI

@Observable
class Player {
    var name = "Manik"
    var highScore = 0
}

struct HighScoreView: View {
    var player: Player
    
    var body: some View {
        Text("Your high score: \(player.highScore)")
    }
}
struct ContentView: View {
    @State private var searchText = ""
    @State private var player = Player()
    
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
            if searchText.isEmpty {
                []
            } else {
                allNames.filter { $0.localizedStandardContains(searchText) }
            }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(filteredNames, id: \.self) { name in
                    Text(name)
                    Color.gray
                }
                .searchable(text: $searchText, prompt: "Looking for something?")
                .navigationTitle("Searching")
                VStack {
                    Text("Welcome")
                    HighScoreView(player: player)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

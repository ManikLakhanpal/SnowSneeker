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
    @Environment(Player.self) var player // Will get the value from env to get player
    
    var body: some View {
        @Bindable var player = player
        
        Stepper("High score: \(player.highScore)", value: $player.highScore)
    }
}
struct ContentView: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .environment(player) // sends value of player obj in VStack enviroment
    }
}

#Preview {
    ContentView()
}

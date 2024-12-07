//
//  ContentView.swift
//  SnowSneeker
//
//  Created by Manik Lakhanpal on 22/10/24.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name = "Drake"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var showSheet: Bool = false
    
    var body: some View {
        Button("Tap me") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { user in
            VStack {
                Button(user.name) {
                    showSheet.toggle()
                }
            }
            .presentationDetents([.medium, .large])
        }
        .alert("Welcome", isPresented: $showSheet, presenting: selectedUser) { user in
            Button(user.name) {}
        }
    }
}

#Preview {
    ContentView()
}

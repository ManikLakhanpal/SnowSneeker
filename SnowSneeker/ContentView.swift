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

struct GroupView: View {
    var body: some View {
        Group {
            Text("Manik Lakhanpal")
            Text("Chandigarh")
            Text("19")
        }
        .font(.largeTitle)
    }
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var showSheet: Bool = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
         
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)

            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ContentView()
}

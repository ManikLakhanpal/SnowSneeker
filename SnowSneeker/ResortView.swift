//
//  ResortView.swift
//  SnowSneeker
//
//  Created by Manik Lakhanpal on 09/12/24.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        VStack(spacing: 10) { SkiDetailsView(resort: resort) }
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)

                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                        }
                        .padding(.vertical)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ResortView(resort: Resort.example)
}

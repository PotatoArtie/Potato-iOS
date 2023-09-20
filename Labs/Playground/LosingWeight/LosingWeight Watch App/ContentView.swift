//
//  ContentView.swift
//  LosingWeight Watch App
//
//  Created by Dongju on 2023/09/20.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        if scenePhase == .active {
            VStack {
                Text("Hello, world!")
                Image(systemName: "figure.walk")
                    .imageScale(.large)
                    .padding()
            }
            .padding()
        } else {
            Image(systemName: "figure.walk.motion")
                .imageScale(.large)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

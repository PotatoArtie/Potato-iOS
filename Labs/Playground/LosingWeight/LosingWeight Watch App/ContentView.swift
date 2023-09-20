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
    @State var isInactivated = true
    
    var body: some View {
        VStack{
            
            // Way 1
            if isInactivated {
                Image(systemName: "figure.walk.motion")
                    .imageScale(.large)
                    .padding()
                    .onChange(of: scenePhase) { oldValue, newValue in
                        isInactivated = newValue == .inactive
                    }
            } else {
                Text("Hello, world!")
                Image(systemName: "figure.walk")
                    .imageScale(.large)
                    .padding()
                    .onChange(of: scenePhase) { oldValue, newValue in
                        isInactivated = newValue == .inactive
                    }
            }
            
            
            //Way 2
            /*
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
             */
            
        }
    }
}

#Preview {
    ContentView()
}

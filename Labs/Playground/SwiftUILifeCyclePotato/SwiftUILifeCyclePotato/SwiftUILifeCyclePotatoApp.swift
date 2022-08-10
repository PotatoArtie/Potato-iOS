//
//  SwiftUILifeCyclePotatoApp.swift
//  SwiftUILifeCyclePotato
//
//  Created by Atlas on 2022/04/19.
//

import SwiftUI

@main
struct SwiftUILifeCyclePotatoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            HomeView()
                .onChange(of: scenePhase) { status in
                    switch status {
                    case .background:
                        print("background")
                    case .active:
                        print("active")
                    case .inactive:
                        print("inactive")
                    default:
                        break
                    }
                }
        }
    }
}

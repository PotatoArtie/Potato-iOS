//
//  HomeView.swift
//  SwiftUILifeCyclePotato
//
//  Created by Atlas on 2022/04/19.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            NavigationLink.init {
                DetailView()
            } label: {
                Text("show DetailView")
            }.onAppear {
                print("HomeView onAppear")
            }.onDisappear {
                print("HomeView onDisappear")
            }
        }
    }
}

struct DetailView: View {
    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
        Text("Hello, DetailView")
            .onAppear(perform: {
                print("===>DetailView onAppear")
            })
            .onDisappear(perform: {
                print("===>DetailView onDisappear")
            })
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



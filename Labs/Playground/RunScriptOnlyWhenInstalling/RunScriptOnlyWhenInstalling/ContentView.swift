//
//  ContentView.swift
//  RunScriptOnlyWhenInstalling
//
//  Created by Dongju on 2023/10/20.
//

import SwiftUI

class SharedPreference: ObservableObject {
    @Published var buildTimeStamp: String = ""
    
    func forKey(){
        self.buildTimeStamp =  (Bundle.main.infoDictionary?["BuildTimeStamp"] as? String)?.replacingOccurrences(of: "\\", with: "") ?? "-"
    }
    
}

struct ContentView: View {
    @ObservedObject var viewmodel = SharedPreference()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text(viewmodel.buildTimeStamp)
        }
        .padding()
        .onAppear{
            viewmodel.forKey()
        }
    }
}

#Preview {
    ContentView()
}

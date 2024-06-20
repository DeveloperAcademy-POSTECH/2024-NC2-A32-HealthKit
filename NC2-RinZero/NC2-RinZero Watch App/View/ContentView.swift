//
//  ContentView.swift
//  NC2-RinZero Watch App
//
//  Created by Seo-Jooyoung on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                MainView()
                    .tabItem {
                        Label("Main", systemImage: "circle.fill")
                    }
                StartView()
                    .tabItem {
                        Label("Start", systemImage: "circle.fill")
                    }
                EndPauseView()
                    .tabItem {
                        Label("End Pause", systemImage: "circle.fill")
                    }
            }
            .tabViewStyle(PageTabViewStyle())
        }
        
    }
}

#Preview {
    ContentView()
}

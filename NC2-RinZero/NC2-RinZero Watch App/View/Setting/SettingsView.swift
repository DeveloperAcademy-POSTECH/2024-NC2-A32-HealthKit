//
//  SettingsView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        
        
        NavigationStack {
            List {
                NavigationLink(destination: DistanceInputView()) {
                    HStack {
                        VStack {
                            Text("Distance")
                                .font(.system(size: 12))
                                .opacity(0.5)
                                .padding(.trailing, 10)
                            Text("5km")
                                .font(.system(size: 35))
                        }
                        .padding()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 10, height: 20)
                            .opacity(0.5)
                            .padding(.leading, 60)
                    }
                }
                NavigationLink(destination: TimeInputView()) {
                    HStack {
                        VStack {
                            Text("Time")
                                .font(.system(size: 12))
                                .opacity(0.5)
                                .padding(.trailing, 60)
                            Text("30min")
                                .font(.system(size: 35))
                        }
                        .padding()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 10, height: 20)
                            .opacity(0.5)
                            .padding(.leading, 30)
                    }
                }
            }
            .listStyle(CarouselListStyle())
            .padding(.top, 10)
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}

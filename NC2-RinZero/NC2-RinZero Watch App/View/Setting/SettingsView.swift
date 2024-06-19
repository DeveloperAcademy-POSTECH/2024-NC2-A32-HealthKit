//
//  SettingsView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedDistance = UserDefaults.standard.integer(forKey: "selectedDistance")
    @State private var selectedHour = UserDefaults.standard.integer(forKey: "selectedHour")
    @State private var selectedMinute = UserDefaults.standard.integer(forKey: "selectedMinute")
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: DistanceInputView(selectedDistance: $selectedDistance)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Distance")
                                .font(.system(size: 12))
                                .opacity(0.5)
                            Text("\(selectedDistance)km")
                                .font(.system(size: 30))
                        }
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 10, height: 20)
                            .opacity(0.5)
                    }
                    .padding()
                }
                NavigationLink(destination: TimeInputView(selectedHour: $selectedHour, selectedMinute: $selectedMinute)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Time")
                                .font(.system(size: 12))
                                .opacity(0.5)
                            Text("\(selectedHour)시간 \(selectedMinute)분")
                                .font(.system(size: 30))
                        }
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .frame(width: 10, height: 20)
                            .opacity(0.5)
                    }
                    .padding()
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

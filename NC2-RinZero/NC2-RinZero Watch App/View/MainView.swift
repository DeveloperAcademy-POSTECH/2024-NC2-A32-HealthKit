//
//  MainView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//


import SwiftUI

struct MainView: View {
    @State private var selectedDistance = UserDefaults.standard.integer(forKey: "selectedDistance")
    @State private var selectedHour = UserDefaults.standard.integer(forKey: "selectedHour")
    @State private var selectedMinute = UserDefaults.standard.integer(forKey: "selectedMinute")
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SettingsView(selectedDistance: $selectedDistance, selectedHour: $selectedHour, selectedMinute: $selectedMinute)) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .tint(.clear)
                .frame(width: 30, height: 30)
                .padding(.trailing, 130)
                .padding(.bottom, 20)

                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 90)
            }
            .foregroundStyle(AppColor.main)
            .padding(.bottom, 60)
        }
    }
}

#Preview {
    MainView()
}

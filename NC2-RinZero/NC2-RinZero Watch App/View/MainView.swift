//
//  MainView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//


import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .tint(.clear)
                .frame(width: 30, height: 30)
                .padding(.trailing, 130)
                .padding(.bottom, 20)

                Text("Even")
                    .font(.system(size: 52, weight: .black))
                    .padding(.bottom, -45)
                    .padding(.trailing, 38)
                Text("Pace")
                    .font(.system(size: 52, weight: .black))
                    .padding(.leading, 38)
            }
            .foregroundStyle(.pink)
            .padding(.bottom, 60)
        }
    }
}

#Preview {
    MainView()
}

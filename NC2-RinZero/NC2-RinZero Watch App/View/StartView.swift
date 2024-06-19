//
//  StartView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            Image("Frame 18")
                .resizable()
                .frame(width: 250, height: 250)
            Text("START")
                .foregroundStyle(.white)
                .font(.system(size: 36, weight: .bold))
        }
    }
}

#Preview {
    StartView()
}

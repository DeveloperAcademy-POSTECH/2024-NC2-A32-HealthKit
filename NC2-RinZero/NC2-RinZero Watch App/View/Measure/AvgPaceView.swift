//
//  AvgPaceView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct AvgPaceView: View {
    @Binding var selectedDistance: Int
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    
    var body: some View {
        VStack {
            ZStack {
                Image("BackgroundSymbol")
                    .resizable()
                    .frame(width: 250, height: 250)
                VStack{
                    Text("6'00''")
                        .foregroundStyle(.white)
                        .font(.system(size: 36, weight: .bold))
                    Text("Avg. Pace")
                        .font(.system(size: 12, weight: .regular))
                        .opacity(0.4)
                }
            }
            .padding(.bottom, -10)
            HStack {
                VStack {
                    Text("\(selectedDistance)")
                        .font(.system(size: 20, weight: .medium))
                    Text("km")
                        .font(.system(size: 12, weight: .regular))
                        .opacity(0.4)
                }
                Spacer()
                VStack {
                    Text("\(selectedHour * 60 + selectedMinute)")
                        .font(.system(size: 20, weight: .medium))
                    Text("min")
                        .font(.system(size: 12, weight: .regular))
                        .opacity(0.4)
                }
            }
            .padding(.horizontal)
            .padding(.top, -70)
        }
    }
}

#Preview {
    AvgPaceView(selectedDistance: .constant(0), selectedHour: .constant(0), selectedMinute: .constant(0))
}

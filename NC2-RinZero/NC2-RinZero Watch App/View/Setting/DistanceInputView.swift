//
//  DistanceInputView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct DistanceInputView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedDistance : Int
    
    let numbers = Array(0...100)
    
    var body: some View {
        VStack {
            VStack {
                    Picker("Distance", selection: $selectedDistance) {
                        ForEach(numbers, id: \.self) { number in
                            Text("\(number)").tag(number)
                                .foregroundStyle(number == selectedDistance ? .pink : .white)
                                .font(.system(size: 24))
                        }
                    }
                    .foregroundStyle(Color.pink)
                    .pickerStyle(.wheel)
                .frame(width: 160, height: 100)
                .clipped()
            }
            Button(action: {
                dismiss()
                print("\($selectedDistance)")
            }) {
                Text("Set")
                    .font(.headline)
                    .padding()
                    .background(Color.clear)
                    .foregroundStyle(.pink)
                    .cornerRadius(10)
            }
        }
        .padding(.top, 10)
    }
}

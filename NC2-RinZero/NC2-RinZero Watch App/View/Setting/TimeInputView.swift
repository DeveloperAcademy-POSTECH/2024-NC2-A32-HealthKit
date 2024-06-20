//
//  TimeInputView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct TimeInputView: View {
    @Environment(\.dismiss) var dismiss
    
//    @State private var selectedHour = 0
//    @State private var selectedMinute = 0
    @Binding var selectedHour: Int
    @Binding var selectedMinute: Int
    
    let hours = Array(0...23)
    let minutes = Array(0...59) 
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    CustomPicker(selectedValue: $selectedHour, range: hours, label: "Hour")
                    CustomPicker(selectedValue: $selectedMinute, range: minutes, label: "Minute")
                }
                Button(action: {
                    print("")
                }) {
                    Text("Set")
                        .font(.headline)
                        .padding()
                        .background(Color.clear)
                        .foregroundStyle(.pink)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 23)
        }
    }
    
        
}


struct CustomPicker: View {
    @Binding var selectedValue: Int
    let range: [Int]
    let label: String
    
    var body: some View {
        VStack {
            Picker("\(label)", selection: $selectedValue) {
                ForEach(range, id: \.self) { value in
                    Text("\(value)")
                        .font(.system(size: 24))
                        .padding()
                        .background(Color.clear)
                        .cornerRadius(8)
                        .foregroundColor(value == selectedValue ? .pink : .primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.clear, lineWidth: 2)
                        )
                        .tag(value)
                }
            }
            .foregroundStyle(.pink)
            .pickerStyle(.wheel)
            .frame(height: 100)
            .clipped()
        }
    }
}

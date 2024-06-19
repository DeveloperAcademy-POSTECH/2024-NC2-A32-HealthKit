//
//  TimeInputView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct TimeInputView: View {
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    
    let hours = Array(0...23)
    let minutes = Array(0...59) 
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    CustomPicker(selectedValue: $selectedHour, range: hours, label: "Hour")
                    CustomPicker(selectedValue: $selectedMinute, range: minutes, label: "Minute")
                }
                .frame(height: 120)
//                Text("Selected time: \(String(format: "%02d", selectedHour)):\(String(format: "%02d", selectedMinute))")
//                    .font(.headline)
//                    .padding(.bottom,30)
                HStack {
                    VStack {
                        Button(action: {
                            print()
                        }) {
                            Image(systemName: "multiply")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 40)
                    }
                    VStack {
                        Button(action: {
                            print()
                        }) {
                            Image(systemName: "checkmark")
                                .font(.headline)
                                .foregroundColor(.pink)
                        }
                    }
                    .padding(.leading, 40)
                }
                .padding(.top, 10)
            }
        }
//            .navigationTitle("Time")
        }
        
    }


struct CustomPicker: View {
    @Binding var selectedValue: Int
    let range: [Int]
    let label: String
    
    var body: some View {
        VStack {
//            Text(label)
//                .font(.headline)
            Picker("\(label)", selection: $selectedValue) {
                ForEach(range, id: \.self) { value in
                    Text("\(value)")
                        .font(.system(size: 24))
                        .padding()
                        .background(value == selectedValue ? Color.clear : Color.clear)
                        .cornerRadius(8)
                        .foregroundColor(value == selectedValue ? .pink : .primary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(value == selectedValue ? Color.clear : Color.clear, lineWidth: 2)
                        )
                        .tag(value)
                }
            }
            .pickerStyle(.wheel)
            //.frame(width: 80, height: 140) // Picker의 너비와 높이 조정
            .clipped()
        }
    }
}

struct TimeInputView_Previews: PreviewProvider {
    static var previews: some View {
        TimeInputView()
    }
}

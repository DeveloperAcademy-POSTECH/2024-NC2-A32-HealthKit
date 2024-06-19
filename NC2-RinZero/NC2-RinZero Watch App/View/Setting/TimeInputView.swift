//
//  TimeInputView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct TimeInputView: View {
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
                .frame(height: 120)
//                Text("Selected time: \(String(format: "%02d", selectedHour)):\(String(format: "%02d", selectedMinute))")
//                    .font(.headline)
//                    .padding(.bottom,30)
                // MARK: - padding보다는 Spacer로 주는 게 좋을 듯 해서 변경했어유 .. ㅎㅎ
                Spacer()
                
                // TODO: - VStack과 padding 값 없애고 Spacer() 사용 ~
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
                            // TODO: - 시간 저장 후, 설정 화면으로 이동
                            print("\(selectedHour)")
                            print("\(selectedMinute)")
                        }) {
                            Image(systemName: "checkmark")
                                .font(.headline)
                                .foregroundColor(.pink)
                        }
                    }
                    .padding(.leading, 40)
                }
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
            // TODO: - picker 너비 조정 ? 확인하기 ~
            // MARK: - 높이는 Hour랑 NavigationBackbutton이랑 겹쳐서 조정했어유
            .frame(height: 100)
            // Picker의 너비와 높이 조정
            .clipped()
        }
    }
}

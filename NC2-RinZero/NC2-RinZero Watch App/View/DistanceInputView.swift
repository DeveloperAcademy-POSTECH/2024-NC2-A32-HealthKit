//
//  DistanceInputView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct DistanceInputView: View {
    @State private var selectedNumber = 1
    
    let numbers = Array(1...100)
    
    var body: some View {
//        NavigationView {
        VStack {
            VStack {
                VStack {
                    Picker("Distance", selection: $selectedNumber) {
                        ForEach(numbers, id: \.self) { number in
                            Text("\(number)").tag(number)
                                .foregroundStyle(.white)
                        }
                    }
                    .foregroundStyle(Color.pink)
                    .pickerStyle(.wheel)
                    .overlay(
                        VStack {
                            Spacer().frame(height: 18)
                            Rectangle()
                                .fill(.clear)
                                .stroke(Color.pink, lineWidth: 5)
                                .cornerRadius(10)
                        }
                    )
                    // Text("Selected number: \(selectedNumber)")
                    // .padding()
                }
                // .navigationTitle("Distance")
                .frame(width: 180, height: 100)
                .clipped()
                // .padding(.bottom, 20)
            }
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
        .padding(.top, 20)
    }
}


struct DistanceInputView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceInputView()
    }
}


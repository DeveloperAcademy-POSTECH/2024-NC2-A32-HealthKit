//
//  EndPauseView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct EndPauseView: View {
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    print()
                }) {
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .opacity(0.5)
                            .frame(width: 78, height: 50)
                            .cornerRadius(24)
                        Rectangle()
                            .fill(.black)
                            .opacity(0.6)
                            .frame(width: 20, height: 20)
                    }
                }
                .tint(.clear)
                
                Text("End")
                    .font(.system(size: 12))
                    .opacity(0.8)
            }
            .padding(.trailing, 8)
            VStack {
                Button(action: {
                    print()
                }) {
                    ZStack {
                        Rectangle()
                            .fill(.pink)
                            .frame(width: 78, height: 50)
                            .opacity(0.5)
                            .cornerRadius(24)
                        Image(systemName: "pause")
                            .resizable()
                            .frame(width: 14, height: 20)
                            .opacity(0.6)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }

                }
                .tint(.clear)


                Text("Pause")
                    .font(.system(size: 12))
                    .opacity(0.8)

            }
        }
    }
}

#Preview {
    EndPauseView()
}

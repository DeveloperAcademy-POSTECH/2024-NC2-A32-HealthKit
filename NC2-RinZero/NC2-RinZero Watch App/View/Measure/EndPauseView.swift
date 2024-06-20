//
//  EndPauseView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//

import SwiftUI

struct EndPauseView: View {
    @State var isRunningContinued: Bool = false
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    print()
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(AppColor.white)
                            .opacity(0.5)
                            .frame(width: 78, height: 50)
                            .cornerRadius(24)
                        Rectangle()
                            .foregroundStyle(AppColor.black)
                            .opacity(0.6)
                            .frame(width: 20, height: 20)
                    }
                }
                .tint(.clear)
                
                Text("End")
                    .font(.system(size: 12))
                    .opacity(0.8)
            }
            
            Spacer()
            
            VStack {
                Button(action: {
                    isRunningContinued.toggle()
                }) {
                    VStack{
                        ZStack {
                            Rectangle()
                                .foregroundStyle(AppColor.main)
                                .frame(width: 78, height: 50)
                                .opacity(isRunningContinued ? 0.5 : 0.8)
                                .cornerRadius(24)
                            Image(systemName: isRunningContinued ? "pause" : "arrow.clockwise")
                                .resizable()
                                .frame(width: isRunningContinued ? 14 : 20,
                                       height: isRunningContinued ? 20 : 25)
                                .opacity(0.6)
                                .fontWeight(.bold)
                                .foregroundStyle(AppColor.white)
                        }
                    }
                }
                .tint(.clear)
                
                Text(isRunningContinued ? "Pause" : "Resume")
                    .font(.system(size: 12))
                    .opacity(0.8)
                    .foregroundStyle(AppColor.white)
            }
        }
    }
}

#Preview {
    EndPauseView()
}

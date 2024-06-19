//
//  EndResumeView.swift
//  NC2-RinZero Watch App
//
//  Created by Taerin Kim on 6/19/24.
//
import SwiftUI

struct EndResumeView: View {
    var body: some View {
        HStack {
            VStack {
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
                Text("End")
                    .font(.system(size: 12))
                    .opacity(0.8)
            }
            .padding(.trailing, 8)
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 78, height: 50)
                        .cornerRadius(24)
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .frame(width: 20, height: 25)
                        .fontWeight(.bold)
                }
                Text("Resume")
                    .font(.system(size: 12))
                    .opacity(0.8)
            }
        }
    }
}

#Preview {
    EndResumeView()
}

//
//  SpeedTestView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

struct SpeedTestView: View {
    
    private let gradient = LinearGradient(colors: [.blue, .white], startPoint: .leading, endPoint: .trailing)
    
    var body : some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                
                Text("Speed Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                ZStack {
                    Circle()
                        .trim(from: 0.1, to: 0.9)
                        .stroke(gradient, lineWidth: 20)
                        .frame(width: geo.size.width - 150, height: geo.size.width - 150)
                        .rotationEffect(.degrees(90))
                    Button {
                        
                    } label: {
                        Text("GO")
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
                VStack {
                    Text("Test your Internet connection speed")
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
            
//            .padding(.horizontal, 25)
            
        }
    }
}

#Preview {
    SpeedTestView()
}

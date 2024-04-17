//
//  SpeedTestView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

struct SpeedTestView: View {
    
    var body : some View {
        GeometryReader { geo in
            VStack(spacing: 20) {
                Text("Speed Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                ZStack {
                    Circle()
                        .strokeBorder(.blue, lineWidth: 20)
                        .frame(width: geo.size.width - 150, height: geo.size.width - 150)
                    Button {
                        
                    } label: {
                        Text("GO")
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
                VStack {
                    Text("Измерьте скорость интернета")
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

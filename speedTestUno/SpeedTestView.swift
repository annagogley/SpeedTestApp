//
//  SpeedTestView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

//MARK: - SpeedTest View
struct SpeedTestView: View {
    
    @ObservedObject var vm = ViewModel()
//    var scheme: ColorScheme
    
    var body : some View {
        GeometryReader { geo in
            NavigationStack {
                VStack(alignment: .leading, spacing: 20) {
                    ZStack {
                        Circle()
                            .trim(from: 0.1, to: 0.9)
                            .stroke(vm.gradient, lineWidth: 20)
                            .frame(width: geo.size.width - 150, height: geo.size.width)
                            .frame(maxWidth: .infinity)
                            .rotationEffect(.degrees(90))
                        Button {
                            vm.goButtonClicked()
                        } label: {
                            Text("GO")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundStyle(.stBlue)
                        }
                    }
                    HStack {
                        VStack(spacing: 10) {
                            Text("Your download speed:")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.stBlue)
                            Text("\(vm.downloadSpeed == 0 ? "--" : "\(vm.downloadSpeed)") Mb/s")
                                .font(.system(size: 14, weight: .bold))
                        }
                        Spacer()
                        Rectangle()
                            .frame(width: 1)
                            .foregroundColor(.gray)
                        Spacer()
                        VStack(spacing: 10) {
                            Text("Your upload speed:")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.stBlue)
                            Text("\(vm.uploadSpeed == 0 ? "--" : "\(vm.uploadSpeed)") Mb/s")
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                    
                    VStack(alignment: .center) {
                        Spacer()
                        Text("Test your Internet connection speed")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 100)
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.top, .horizontal], 20)
                .navigationTitle("Speed Test")
            }
        }
        .background(Color.purple)
//        .environment(\.colorScheme, scheme)
    }
}

#Preview {
//    SpeedTestView(scheme: .light)
    SpeedTestView()
}

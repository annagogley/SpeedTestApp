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
                            if !vm.isOnUpload && !vm.isOnDownload {
                                vm.showAlert.toggle()
                            }
                        } label: {
                            Text("GO")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundStyle(.stBlue)
                        }
                    }
                    HStack {
                        if vm.isOnDownload {
                            VStack(spacing: 10) {
                                Text("Your download speed:")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(.stBlue)
                                Text("\(vm.downloadSpeed == 0 ? "--" : "\(vm.downloadSpeed)") Mb/s")
                                    .font(.system(size: 14, weight: .bold))
                            }
                            .overlay {
                                if vm.isDownloading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                }
                            }
                            Spacer()
                        }
                        if vm.isOnUpload && vm.isOnDownload {
                            Rectangle()
                                .frame(width: 1, height: 50)
                                .foregroundColor(.gray)
                        }
                        if vm.isOnUpload {
                            Spacer()
                            VStack(spacing: 10) {
                                Text("Your upload speed:")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(.stBlue)
                                Text("\(vm.uploadSpeed == 0 ? "--" : "\(vm.uploadSpeed)") Mb/s")
                                    .font(.system(size: 14, weight: .bold))
                            }
                            .overlay {
                                if vm.isUploading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                }
                            }
                        }
                    }
                    VStack(alignment: .center) {
                        Text("Test your Internet connection speed. Attention: several MB of your traffic may be wasted")
                            .lineLimit(3)
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
            .alert("Please, select at least one test option in settings", isPresented: $vm.showAlert) {
                Button {
                    vm.showAlert.toggle()
                } label: {
                    Text("OK")
                }

            }
        }
        .background(Color.purple)
    }
}

#Preview {
    SpeedTestView()
}

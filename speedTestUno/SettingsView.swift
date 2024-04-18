//
//  SettingsView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isOnDownload = UserStorage.shared.bool(forKey: .isOnDownload)
    @State private var isOnUpload = UserStorage.shared.bool(forKey: .isOnUpload)
    
    var body : some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 24) {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Change theme")
                    .font(.system(size: 16, weight: .medium))
                Text("URL")
                    .font(.system(size: 16, weight: .medium))
                Toggle(isOn: $isOnDownload) {
                    Text("Test download speed")
                        .font(.system(size: 16, weight: .medium))
                }
                .onChange(of: isOnDownload) {
                    UserStorage.shared.set(isOnDownload, forKey: .isOnDownload)
                }
                Toggle(isOn: $isOnUpload) {
                    Text("Test upload speed")
                        .font(.system(size: 16, weight: .medium))
                }
                .onChange(of: isOnUpload) {
                    UserStorage.shared.set(isOnUpload, forKey: .isOnUpload)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .onAppear {
                isOnDownload = UserStorage.shared.bool(forKey: .isOnDownload)
                isOnUpload = UserStorage.shared.bool(forKey: .isOnUpload)
            }
        }
    }
}

#Preview {
    SettingsView()
}

//
//  SettingsView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isOnDownload = false
    @State private var isOnUpload = false
    
    var body : some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 24) {
                Text("Настройки")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Изменить тему")
                    .font(.system(size: 16, weight: .medium))
                Text("URL")
                    .font(.system(size: 16, weight: .medium))
                Toggle(isOn: $isOnDownload) {
                    Text("Измерять скорость загрузки")
                        .font(.system(size: 16, weight: .medium))
                }
                Toggle(isOn: $isOnUpload) {
                    Text("Измерять скорость отдачи")
                        .font(.system(size: 16, weight: .medium))
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    SettingsView()
}

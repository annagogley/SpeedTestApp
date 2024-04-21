//
//  SettingsView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

//MARK: - Settings View
struct SettingsView: View {
    
    @ObservedObject var vm = ViewModel()
    var scheme: ColorScheme
    
    var body : some View {
        NavigationStack {
            List {
                Section("Appearance"){
                    Picker("Change theme", selection: $vm.selectedTheme) {
                        ForEach(Theme.allCases) { theme in
                            Text(theme.title)
                        }
                    }
                    .onChange(of: vm.selectedTheme, { oldValue, newValue in
                        HapticManager.shared.impact(style: .light)
                        UserStorage.shared.theme = vm.selectedTheme
                    })
                }
                Section("Download URL") {
                    TextField("URL of server for speed test", text: $vm.urlForDownloadSpeedTest)
                        .onSubmit {
                            UserStorage.shared.urlDownloadString = vm.urlForDownloadSpeedTest
                        }
                }
                Section("Upload URL") {
                    TextField("URL for upload speed test", text: $vm.urlForUploadSpeedTest)
                        .onSubmit {
                            UserStorage.shared.urlDownloadString = vm.urlForUploadSpeedTest
                        }
                }
                Section("Choose testing methods") {
                    Toggle(isOn: $vm.isOnDownload) {
                        Text("Test download speed")
                            .font(.system(size: 16, weight: .medium))
                    }
                    .onChange(of: vm.isOnDownload) {
                        HapticManager.shared.impact(style: .light)
                        vm.toggleCheckBox(with: vm.isOnDownload, for: .isOnDownload)
                    }
                    Toggle(isOn: $vm.isOnUpload) {
                        Text("Test upload speed")
                            .font(.system(size: 16, weight: .medium))
                    }
                    .onChange(of: vm.isOnUpload) {
                        HapticManager.shared.impact(style: .light)
                        vm.toggleCheckBox(with: vm.isOnUpload, for: .isOnUpload)
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .environment(\.colorScheme, scheme)
    }
}

#Preview {
    SettingsView(scheme: .light)
}

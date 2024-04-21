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
                        UserStorage.shared.theme = vm.selectedTheme
                        print(oldValue, newValue)
                    })
                }
                Section("URL") {
                    TextField("URL of server for speed test", text: $vm.urlForSpeedTest)
                }
                Section("Choose testing methods") {
                    Toggle(isOn: $vm.isOnDownload) {
                        Text("Test download speed")
                            .font(.system(size: 16, weight: .medium))
                    }
                    Toggle(isOn: $vm.isOnUpload) {
                        Text("Test upload speed")
                            .font(.system(size: 16, weight: .medium))
                    }
                    .onChange(of: vm.isOnUpload) {
                        vm.toggleCheckBox(with: vm.isOnUpload, for: .isOnUpload)
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .environment(\.colorScheme, scheme)
//        .preferredColorScheme(UserStorage.shared.theme.colorScheme)
    }
}

#Preview {
    SettingsView(scheme: .light)
}

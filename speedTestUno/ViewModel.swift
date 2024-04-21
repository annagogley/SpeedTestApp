//
//  SpeedTestViewModel.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 18.04.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    //MARK: - Properties
    let gradient = LinearGradient(colors: [.stBlue, .stWhite], startPoint: .leading, endPoint: .trailing)
    
    @Published var isOnDownload = UserStorage.shared.bool(forKey: .isOnDownload)
    @Published var isOnUpload = UserStorage.shared.bool(forKey: .isOnUpload)
    @Published var selectedTheme = UserStorage.shared.theme
    
    @Published var urlForDownloadSpeedTest : String = UserStorage.shared.urlDownloadString
    @Published var urlForUploadSpeedTest : String = UserStorage.shared.urlUploadString
    
    @Published var downloadSpeed : Double = UserStorage.shared.double(forKey: .downloadSpeed)
    @Published var uploadSpeed : Double = UserStorage.shared.double(forKey: .uploadSpeed)
    
    @Published var showAlert : Bool = false
    
    @Published var isDownloading = false
    @Published var isUploading = false

    
    //MARK: - Methods
    func goButtonClicked() {
        HapticManager.shared.impact(style: .heavy)
        let networkMonitor = NetworkMonitor(urlString: urlForDownloadSpeedTest)
        if isOnDownload {
            isDownloading = true
            networkMonitor.getDownloadSpeed() { result in
                self.downloadSpeed = Double(round(result * 100) / 100)
                UserStorage.shared.set(self.downloadSpeed, forKey: .downloadSpeed)
                self.isDownloading = false
            }
        }
        if isOnUpload {
            isUploading = true
            networkMonitor.getUploadSpeed { time in
                self.uploadSpeed = Double(round(10.7 / time * 100) / 100)
                UserStorage.shared.set(self.uploadSpeed, forKey: .uploadSpeed)
                self.isUploading = false
            }
        }
    }
    
    func toggleCheckBox(with value: Bool, for key: UserStorageType) {
        UserStorage.shared.set(value, forKey: key)
    }
    
    func setColor(scheme: ColorScheme, for key: UserStorageType) {
        UserStorage.shared.set(scheme, forKey: key)
    }
}



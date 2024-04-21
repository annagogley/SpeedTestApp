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
    @Published var urlForSpeedTest : String = "https://link.testfile.org/PDF100MB"
    @Published var downloadSpeed : Double = 0
    @Published var uploadSpeed : Double = 0

    
    //MARK: - Methods
    func goButtonClicked() {
        let networkMonitor = NetworkMonitor(urlString: urlForSpeedTest)        
        if isOnDownload {
            networkMonitor.getDownloadSpeed() { result in
                self.downloadSpeed = Double(round(result * 100) / 100)
            }
        }
        if isOnUpload {
            networkMonitor.getUploadSpeed { result in
                self.uploadSpeed = Double(round(result * 100) / 100)
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



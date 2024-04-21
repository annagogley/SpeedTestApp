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
    @Published var urlForSpeedTest : String = "https://www.sample-videos.com/zip/30mb.zip"
    
    //MARK: - Methods
    func goButtonClicked() {
        var networkMonitor = NetworkMonitor(urlString: urlForSpeedTest)
        networkMonitor.getDownloadSpeed()
    }
    
    func toggleCheckBox(with value: Bool, for key: UserStorageType) {
        UserStorage.shared.set(value, forKey: key)
    }
    
    func setColor(scheme: ColorScheme, for key: UserStorageType) {
        UserStorage.shared.set(scheme, forKey: key)
    }
}



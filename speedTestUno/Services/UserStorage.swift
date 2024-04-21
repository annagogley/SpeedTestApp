//
//  DefaultService.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import Foundation

enum UserStorageType: String {
    case isOnDownload, isOnUpload, userTheme, downloadSpeed, uploadSpeed
}

//MARK: - User Storage service
class UserStorage {
    //делаем синглтон
    static let shared = UserStorage()
    
    // save theme
    var theme: Theme {
        get {
            if let value = UserDefaults.standard.string(forKey: "userTheme") {
                guard let theme = Theme(rawValue: value) else {
                    return .system
                }
                return theme
            }
            return .system
        }
        set {
            UserDefaults.standard.setValue(newValue.rawValue, forKey: "userTheme")
        }
    }
    
    //url для загрузки
    var urlDownloadString: String {
        get {
            if let value = UserDefaults.standard.string(forKey: "urlDownloadString") {
                return value
            }
            return "https://link.testfile.org/PDF30MB"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "urlDownloadString")
        }
    }
    
    //url для отдачи
    var urlUploadString: String {
        get {
            if let value = UserDefaults.standard.string(forKey: "urlUploadString") {
                return value
            }
            return "https://httpbin.org/post"
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "urlUploadString")
        }
    }
    
    //MARK: - Methods
    func bool(forKey key: UserStorageType) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func set(_ value: Any?, forKey key: UserStorageType) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func double(forKey key: UserStorageType) -> Double {
        UserDefaults.standard.double(forKey: key.rawValue)
    }
}

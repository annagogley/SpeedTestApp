//
//  DefaultService.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import Foundation

enum UserStorageType: String {
    case isOnDownload, isOnUpload, userTheme
}

class UserStorage {
    static let shared = UserStorage()
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
    
    func bool(forKey key: UserStorageType) -> Bool{
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func set(_ value: Any?, forKey key: UserStorageType) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
}

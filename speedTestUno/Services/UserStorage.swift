//
//  DefaultService.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import Foundation

enum UserStorageType: String {
    case isOnDownload, isOnUpload
}

class UserStorage {
    static let shared = UserStorage()
    
    func bool(forKey key: UserStorageType) -> Bool{
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    func set(_ value: Bool, forKey key: UserStorageType) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
}

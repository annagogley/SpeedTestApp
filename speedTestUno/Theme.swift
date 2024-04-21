//
//  Theme.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 18.04.2024.
//

import SwiftUI

//MARK: - Theme enum для изменения темы приложения
enum Theme: String, Identifiable, CaseIterable {
    var id: Self { return self }
    
    case light = "light"
    case dark = "dark"
    case system = "system"
    
    // для отображения в Picker и локализации приложения
    var title: LocalizedStringKey {
        switch self {
        case .light:
            "Lignt"
        case .dark:
            "Dark"
        case .system:
            "System"
        }
    }
    
    // для отображения выбранной темы
    var colorScheme: ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return nil
        }
    }
}

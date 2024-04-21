//
//  HapticManager.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 21.04.2024.
//

import SwiftUI

//для хаптика
final class HapticManager {
    static let shared = HapticManager()
    private init() {}
    public func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

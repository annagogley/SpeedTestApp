//
//  MenuView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

struct MenuView: View {
    
    @State private var selectedTab: Tabs = .speedTest
    @Environment(\.colorScheme) private var scheme 
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                switch selectedTab {
                case .speedTest:
//                    SpeedTestView(scheme: scheme)
                    SpeedTestView()
                        .transition(.move(edge: .leading))
                case .settings:
//                    SettingsView()
                    SettingsView(scheme: scheme)
                        .transition(.move(edge: .trailing))
                }
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height - 80)
                    STTabBar(selectedTab: $selectedTab)
                }
            }
//            .environment(\.colorScheme, scheme)
            .preferredColorScheme(UserStorage.shared.theme.colorScheme)
        }
    }
}

#Preview {
    MenuView()
}


//
//  MenuView.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

//MARK: - ROOT View
struct MenuView: View {
    
    //MARK: - properties
    @State private var selectedTab: Tabs = .speedTest //по умолчанию находимся на первой вкладке
    @Environment(\.colorScheme) private var scheme //цветовая схема
    
    var body: some View {
        //ТабБар как ZSTack
        ZStack {
            switch selectedTab {
            case .speedTest:
                SpeedTestView()
                    .transition(.move(edge: .leading))
            case .settings:
                SettingsView(scheme: scheme)
                    .transition(.move(edge: .trailing))
            }
            VStack {
                Spacer()
                STTabBar(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(.keyboard)
        .preferredColorScheme(UserStorage.shared.theme.colorScheme)
    }
}

#Preview {
    MenuView()
}


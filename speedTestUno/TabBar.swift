//
//  TabBar.swift
//  speedTestUno
//
//  Created by Аня Воронцова on 17.04.2024.
//

import SwiftUI

//MARK: - Tabs enum
enum Tabs : Int {
    case speedTest = 0
    case settings = 1
}

//MARK: - TabItem Model
struct TabItem : Identifiable {
    var id = UUID()
    var text : LocalizedStringKey
    var image : Image
    var tab : Tabs
}

//MARK: - Экземпляр tabItems
var tabItems = [
    TabItem(text: "Speed test", image: Image(systemName: "gauge.with.needle"), tab: .speedTest),
    TabItem(text: "Settings", image: Image(systemName: "gear"), tab: .settings)
]

//MARK: - SpeedTest TabBar View
struct STTabBar: View {
    @Binding var selectedTab : Tabs
    
    var body : some View {
        GeometryReader { geometry in
            ZStack {
                Capsule()
                    .fill(.blue.gradient)
                    .frame(height: 60)
                    .padding(.horizontal, 16)
                
                HStack {
                    if selectedTab == .settings { Spacer() }
                    Capsule()
                        .fill(.white.gradient)
                        .frame(width: geometry.size.width / 2 - 16, height: 52)
                        .padding(.horizontal, 20)
                    if selectedTab == .speedTest { Spacer() }
                }
                
                HStack(spacing: geometry.size.width / 4) {
                    ForEach(tabItems) { item in
                        Button {
                            withAnimation(.spring(response: 0.6)) {
                                selectedTab = item.tab
                            }
                        } label: {
                            VStack(spacing: 2) {
                                item.image
                                    .foregroundStyle(selectedTab == item.tab ? .blue : .white)
                                Text(item.text)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(selectedTab == item.tab ? .blue : .white)
                            }
                        }
                    }
                }
            }
            .frame(height: 60)
        }
    }
}

//MARK: - Preview
#Preview {
    STTabBar(selectedTab: .constant(.speedTest))
}

//
//  BottomTabBar.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import SwiftUI


enum BottomTabBarItem {
    case home
    case maps
    case inspection
    case settings
}


struct BottomTabBar: View {
    
    static var height: CGFloat = 64
        
    @Binding var selectedItem: BottomTabBarItem
        
    private let y: CGFloat = 22
    private let offset: CGFloat = 50
    
    private func position(of number: Int, width: CGFloat) -> CGFloat {
        let firstToLastDistance = width - 2 * offset
        let interItemSpace = firstToLastDistance / (CGFloat(tabs.count) - 1)
        return CGFloat(number) * interItemSpace + offset
    }
    
    private let tabs: [(icon: Image, text: Text, item: BottomTabBarItem)] = [
        (icon: Image("car"), text: Text("dashboard_tab_home"), item: .home),
        (icon: Image("marker"), text: Text("dashboard_tab_maps"), item: .maps),
        (icon: Image("healthScan"), text: Text("dashboard_tab_inspection"), item: .inspection),
        (icon: Image("settings"), text: Text("dashboard_tab_settings"), item: .settings)
    ]
    
    var body: some View {
        ZStack {
            HStack {
                Color.skodaBackground
                    .frame(height: 44)
                    .offset(y: 44)
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Color.skodaSeparator
                    .frame(height: 1)
                
                GeometryReader { proxy in
                    ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                        BottomTabView(icon: tab.icon, text: tab.text, item: tab.item, selectedItem: $selectedItem)
                            .position(x: position(of: index, width: proxy.size.width), y: y)
                    }
                }
            }
            .frame(height: BottomTabBar.height)
            .background(Color.skodaBackground)
        }
    }
}

struct BottomTabView: View {
    var icon: Image
    var text: Text
    var item: BottomTabBarItem
    @Binding var selectedItem: BottomTabBarItem
            
    private var isSelected: Bool {
        item == selectedItem
    }
    
    var body: some View {
        Button(action: {
            selectedItem = item
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred(intensity: 0.6)
        }) {
            VStack(spacing: 2) {
                icon
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? Color.skodaGreen : .white)
                
                text
                    .font(.regular(size: 11))
                    .foregroundColor(isSelected ? Color.skodaGreen : .white)
            }
        }
        .disabled(isSelected)
    }
}

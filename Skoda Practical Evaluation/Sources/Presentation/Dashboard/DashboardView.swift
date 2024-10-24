//
//  DashboardView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import SwiftUI

struct DashboardView: View {
    
    @State var selectedTab: BottomTabBarItem = .home
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView(selectedTab: $selectedTab)
            case .maps:
                LoadableView(
                    isLoading: .constant(false),
                    error: .constant(nil)
                ) {
                    ScrollView {
                        
                    }
                    .padding(.bottom, 64)
                    .background(Color.skodaBackground)
                }
                .overlay(
                    VStack {
                        Spacer()
                        BottomTabBar(selectedItem: $selectedTab)
                    }
                )
            case .inspection:
                LoadableView(
                    isLoading: .constant(false),
                    error: .constant(nil)
                ) {
                    ScrollView {
                        
                    }
                    .padding(.bottom, 64)
                    .background(Color.skodaBackground)
                }
                .overlay(
                    VStack {
                        Spacer()
                        BottomTabBar(selectedItem: $selectedTab)
                    }
                )
            case .settings:
                LoadableView(
                    isLoading: .constant(false),
                    error: .constant(nil)
                ) {
                    ScrollView {
                        
                    }
                    .padding(.bottom, 64)
                    .background(Color.skodaBackground)
                }
                .overlay(
                    VStack {
                        Spacer()
                        BottomTabBar(selectedItem: $selectedTab)
                    }
                )
            }
        }
    }
}

#Preview {
    DashboardView()
}

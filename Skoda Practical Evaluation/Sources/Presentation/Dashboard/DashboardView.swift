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
                NavigationStack {
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
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("dashboard_tab_maps")
                                .font(.bold(size: 20))
                                .foregroundColor(.white)
                        }
                    }
                }
            case .inspection:
                NavigationStack {
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
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("dashboard_tab_inspection")
                                .font(.bold(size: 20))
                                .foregroundColor(.white)
                        }
                    }
                }
            case .settings:
                SettingsView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    DashboardView()
}

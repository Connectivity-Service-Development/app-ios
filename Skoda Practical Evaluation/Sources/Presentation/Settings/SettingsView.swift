//
//  SettingsView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Input
    
    @Binding var selectedTab: BottomTabBarItem
    
    
    // MARK: - State
    
    @StateObject private var viewModel = ViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            LoadableView(
                isLoading: $viewModel.isLoading,
                error: .constant(nil)
            ) {
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    
                    Text(
                        """
                        This button will refresh all the data and behaviour. 

                        To use Connect LITE app, you need a DataPlug adapter. You can buy it at your ŠKODA dealer and insert into diagnostic board inside your vehicle.
                        """
                    )
                    .font(.regular(size: 16))
                    .foregroundStyle(.white)
                    .padding(.bottom, 102)
                    
                    HStack {
                        Spacer()
                        
                        CapsuleButton(
                            title: "refresh",
                            font: .bold(size: 16), icon: nil,
                            backgroundColor: .skodaGreen,
                            textColor: .skodaBackground,
                            borderColor: nil
                        ) {
                            Task {
                                await viewModel.reset()
                            }
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
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
                    Text("dashboard_tab_settings")
                        .font(.bold(size: 20))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    SettingsView(selectedTab: .constant(.settings))
}

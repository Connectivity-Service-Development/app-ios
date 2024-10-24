//
//  VehicleInfoCard.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import SwiftUI

struct VehicleInfoCard: View {
    
    // MARK: - Input
    
    let title: LocalizedStringKey
    let titleRightContent: AnyView?
    let valueLeftContent: AnyView?
    let value: LocalizedStringKey
    let valueRightContent: AnyView?
    let rightContent: AnyView?
    let bottomContent: AnyView?
    
    
    // MARK: - Initialization
    
    init(
        title: LocalizedStringKey,
        titleRightContent: (() -> AnyView)? = nil,
        valueLeftContent: (() -> AnyView)? = nil,
        value: LocalizedStringKey,
        valueRightContent: (() -> AnyView)? = nil,
        rightContent: (() -> AnyView)? = nil,
        bottomContent: (() -> AnyView)? = nil
    ) {
        self.title = title
        self.titleRightContent = titleRightContent?()
        self.valueLeftContent = valueLeftContent?()
        self.value = value
        self.valueRightContent = valueRightContent?()
        self.rightContent = rightContent?()
        self.bottomContent = bottomContent?()
    }
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Text(title)
                    .font(.regular(size: 14))
                    .foregroundStyle(Color.skodaGrayText)
                
                Spacer()
                
                if let titleRightContent {
                    titleRightContent
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            
            HStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center, spacing: 10) {
                    if let valueLeftContent {
                        valueLeftContent
                    }
                    
                    Text(value)
                        .font(.bold(size: 20))
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                if let valueRightContent {
                    valueRightContent
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, bottomContent == nil ? 16 : 0)
            
            if let bottomContent {
                Color.skodaSeparator
                    .frame(height: 1)
                    .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                
                bottomContent
            }
        }
        .background(Color.skodaLightGray)
        .clipShape(RoundedRectangle(cornerRadius: 4, style: .circular))
        .padding(.top, 8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    VehicleInfoCard(
        title: "vehicle",
        valueLeftContent: {
            AnyView(
                Image("closed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            )
        },
        value: "doors_closed",
        bottomContent: {
            AnyView(
                Text("windows_closed")
                    .font(.regular(size: 14))
                    .foregroundStyle(Color.skodaGrayText)
                    .padding([.horizontal, .bottom], 16)
            )
        }
    )
    
    VehicleInfoCard(
        title: "subscriptions",
        valueLeftContent: {
            AnyView(
                Image("card")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            )
        },
        value: "5 of 6 active",
        bottomContent: {
            AnyView(
                HStack(alignment: .center) {
                    HStack(alignment: .center, spacing: 10) {
                        Circle()
                            .fill(Color.skodaOrange)
                            .frame(width: 20, height: 20)
                            .overlay(
                                Text("2")
                                    .font(.bold(size: 12))
                                    .foregroundStyle(Color.skodaBackground)
                            )
                        
                        Text("will_soon_expire")
                            .font(.regular(size: 14))
                            .foregroundStyle(Color.skodaGrayText)
                    }
                    
                    Spacer()
                }
                .padding([.horizontal, .bottom], 16)
            )
        }
    )
    
    VehicleInfoCard(
        title: "range",
        valueLeftContent: {
            AnyView(
                Image("fastGage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            )
        },
        value: "20 % / 60 km",
        valueRightContent: {
            AnyView(
                Text("disconnected")
                    .font(.regular(size: 14))
                    .foregroundStyle(Color.skodaGrayText)
            )
        }
    )
    
    VehicleInfoCard(
        title: "temperature",
        titleRightContent: {
            AnyView(
                Capsule()
                    .fill(Color.skodaSwitchBackground)
                    .frame(width: 55, height: 24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .circular)
                            .fill(Color.skodaSwitchThumb)
                            .frame(width: 19.04, height: 18)
                            .padding(.horizontal, 3.17),
                        alignment: .trailing
                    )
            )
        },
        value: "24 °C",
        valueRightContent: {
            AnyView(
                Text("off")
                    .font(.regular(size: 14))
                    .foregroundStyle(Color.skodaGrayText)
                    .disabled(true)
            )
        }
    )
}

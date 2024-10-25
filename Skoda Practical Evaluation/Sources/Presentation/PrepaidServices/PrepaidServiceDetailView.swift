//
//  PrepaidServiceDetailView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 25.10.2024.
//

import SwiftUI

struct PrepaidServiceDetailView: View {
    
    // MARK: - Environment
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Input
    
    @Binding var path: NavigationPath
    
    let prepaidService: PrepaidService
    let hasUserActiveSubscription: Bool
    let expirationDate: Date?
    let nearingExpirationDate: Date?
    
    
    // MARK: - Body
    
    var body: some View {
        LoadableView(
            isLoading: .constant(false),
            error: .constant(nil)
        ) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("general_information")
                        .font(.bold(size: 20))
                        .foregroundStyle(Color.skodaSwitchThumb)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline) {
                            Circle()
                                .fill(hasUserActiveSubscription ? Color.skodaActiveGreen : Color.skodaRed)
                                .frame(width: 10, height: 10)
                            
                            VStack(alignment: .leading) {
                                Text(hasUserActiveSubscription ? "active" : "inactive")
                                    .font(.bold(size: 16))
                                    .foregroundStyle(.white)
                                
                                if let nearingExpirationDate {
                                    Text("service_expires_soon")
                                        .font(.regular(size: 12))
                                        .foregroundStyle(Color.skodaOrange)
                                    + Text(" \(nearingExpirationDate.formatted(.dateTime.day().month().year()))")
                                        .font(.regular(size: 12))
                                        .foregroundStyle(Color.skodaOrange)
                                } else if hasUserActiveSubscription, let expirationDate {
                                    Text("service_expires_at")
                                        .font(.regular(size: 12))
                                        .foregroundStyle(Color.skodaGrayText)
                                    + Text(" \(expirationDate.formatted(.dateTime.day().month().year()))")
                                        .font(.regular(size: 12))
                                        .foregroundStyle(Color.skodaGrayText)
                                }
                            }
                        }
                        .padding(.bottom, 8)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                    }
                    .padding(.top, 22)
                    .padding(.bottom, 31)
                    
                    Text("your_personal_data")
                        .font(.bold(size: 20))
                        .foregroundStyle(Color.skodaSwitchThumb)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text("Time Saving")
                                    .font(.bold(size: 16))
                                    .foregroundStyle(.white)
                                
                                Text("Total: 240 h / 2024")
                                    .font(.regular(size: 12))
                                    .foregroundStyle(Color.skodaGrayText)
                            }
                            
                            Spacer()
                            
                            Text("58 h")
                                .font(.regular(size: 14))
                                .foregroundStyle(Color.skodaGreen)
                            + Text(" / 10/2024")
                                .font(.regular(size: 14))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.bottom, 8)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                            .padding(.bottom, 19)
                        
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text("Fuel Saving")
                                    .font(.bold(size: 16))
                                    .foregroundStyle(.white)
                                
                                Text("Total: 159 l / 2024")
                                    .font(.regular(size: 12))
                                    .foregroundStyle(Color.skodaGrayText)
                            }
                            
                            Spacer()
                            
                            Text("72 l")
                                .font(.regular(size: 14))
                                .foregroundStyle(Color.skodaGreen)
                            + Text(" / 10/2024")
                                .font(.regular(size: 14))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.bottom, 8)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                            .padding(.bottom, 19)
                        
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text("Emissions Reduction")
                                    .font(.bold(size: 16))
                                    .foregroundStyle(.white)
                                
                                Text("Total: 180 kg CO₂ / 2024")
                                    .font(.regular(size: 12))
                                    .foregroundStyle(Color.skodaGrayText)
                            }
                            
                            Spacer()
                            
                            Text("50 kg CO₂")
                                .font(.regular(size: 14))
                                .foregroundStyle(Color.skodaGreen)
                            + Text(" / 10/2024")
                                .font(.regular(size: 14))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.bottom, 8)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                    }
                    .padding(.top, 22)
                    .padding(.bottom, 31)
                    
                    Text("description")
                        .font(.bold(size: 20))
                        .foregroundStyle(.white)
                        .padding(.bottom, 14)
                    
                    ForEach(prepaidService.bulletPoints, id: \.self) { point in
                        HStack {
                            Text(">")
                                .font(.regular(size: 16))
                                .foregroundStyle(Color.skodaGrayText)
                                .padding(.bottom, 4)
                            
                            Text(point)
                                .font(.regular(size: 16))
                                .foregroundStyle(Color.skodaGrayText)
                                .padding(.bottom, 4)
                            
                            Spacer()
                        }
                    }
                    
                    Text(prepaidService.description)
                        .font(.regular(size: 16))
                        .foregroundStyle(.white)
                        .padding(.top, 21)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 116)
            }
            .overlay {
                VStack {
                    Spacer()
                    
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 0.0),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 0.5),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 0.5),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 0.7),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 0.7),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 0.7),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 0.9),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 1.0),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 1.0),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 1.0),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 1.0),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 1.0),
                            Color(red: 22/255, green: 23/255, blue: 24/255, opacity: 1.0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 116)
                    .overlay(
                        VStack(alignment: .center, spacing: 16) {
                            Button {
                                path.append(
                                    HomeViewNavigation.prepaidServicePayment(
                                        prepaidService,
                                        (expirationDate ?? Date()) > Date() ? expirationDate : nil
                                    )
                                )
                            } label: {
                                Capsule()
                                    .fill(Color.skodaGreen)
                                    .frame(width: 216, height: 44)
                                    .overlay(
                                        Text("order")
                                            .font(.bold(size: 16))
                                            .foregroundStyle(Color.skodaBackground),
                                        alignment: .center
                                    )
                            }
                        }
                        .padding(.bottom, 32)
                    )
                }
            }
            .padding(.bottom, 64)
            .background(Color.skodaBackground)
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(Color.skodaBackground, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("chevronLeft")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text(prepaidService.serviceName.title)
                    .font(.bold(size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    PrepaidServiceDetailView(
        path: .constant(NavigationPath()),
        prepaidService: .init(
            id: "1",
            serviceName: .infotainmentOnline,
            description: "Test",
            bulletPoints: ["Test"],
            price: 0
        ),
        hasUserActiveSubscription: true,
        expirationDate: nil,
        nearingExpirationDate: nil
    )
}

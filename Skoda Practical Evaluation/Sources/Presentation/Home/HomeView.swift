//
//  HomeView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import SwiftUI

enum HomeViewNavigation: Hashable, Equatable {
    case prepaidServices
    case prepaidServiceDetail(PrepaidService, Bool, Date?, Date?)
    case prepaidServicePayment(PrepaidService, Date?)
    case prepaidServicePaymentSuccess
    
    static func == (lhs: HomeViewNavigation, rhs: HomeViewNavigation) -> Bool {
        switch (lhs, rhs) {
        case (.prepaidServices, .prepaidServices):
            return true
        case (.prepaidServiceDetail, .prepaidServiceDetail):
            return true
        case (.prepaidServicePayment, .prepaidServicePayment):
            return true
        case (.prepaidServicePaymentSuccess, .prepaidServicePaymentSuccess):
            return true
        default:
            return true
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .prepaidServices:
            hasher.combine("prepaidServices")
        case .prepaidServiceDetail:
            hasher.combine("prepaidServiceDetail")
        case .prepaidServicePayment:
            hasher.combine("prepaidServicePayment")
        case .prepaidServicePaymentSuccess:
            hasher.combine("prepaidServicePaymentSuccess")
        }
    }
}

struct HomeView: View {
    
    // MARK: - Input
    
    @Binding var selectedTab: BottomTabBarItem
    
    
    // MARK: - State
    
    @StateObject private var viewModel = ViewModel()
    @State private var path = NavigationPath()
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $path) {
            LoadableView(
                isLoading: .constant(false),
                error: .constant(nil)
            ) {
                ScrollView {
                    VStack(spacing: 0) {
                        topBar
                        
                        if viewModel.hasServiceExpiringInLessThanAMonth, !viewModel.hideExpirationReminderBanner {
                            PrepaidServicesExpirationReminderView(
                                hideExpirationReminderBanner: $viewModel.hideExpirationReminderBanner,
                                myPrepaidServices: $viewModel.myPrepaidServices,
                                allPrepaidServices: $viewModel.prepaidServices,
                                path: $path
                            )
                            .padding(.top, 8)
                        }
                        
                        carImage
                        
                        vehicleStatusCard
                        
                        subscriptionCard
                        
                        rangeCard
                        
                        temperatureCard
                        
                        Spacer()
                    }
                }
                .task {
                    await viewModel.fetchMyPrepaidServices()
                    await viewModel.fetchAllPrepaidServices()
                }
                .padding(.bottom, 64)
                .background(Color.skodaBackground)
            }
            .navigationDestination(for: HomeViewNavigation.self) { navigation in
                switch navigation {
                case .prepaidServices:
                    PrepaidServicesView(path: $path)
                case .prepaidServiceDetail(let prepaidService, let hasUserActiveSubscription, let expirationDate, let nearingExpirationDate):
                    PrepaidServiceDetailView(
                        path: $path,
                        prepaidService: prepaidService,
                        hasUserActiveSubscription: hasUserActiveSubscription,
                        expirationDate: expirationDate,
                        nearingExpirationDate: nearingExpirationDate
                    )
                case .prepaidServicePayment(let prepaidService, let expirationDate):
                    PrepaidServicePaymentView(
                        path: $path,
                        prepaidService: prepaidService,
                        expirationDate: expirationDate
                    )
                case .prepaidServicePaymentSuccess:
                    PrepaidServicePaymentSuccessView(path: $path)
                }
            }
        }
        .overlay(
            VStack {
                Spacer()
                BottomTabBar(selectedItem: $selectedTab)
            }
        )
    }
    
    var topBar: some View {
        HStack(alignment: .center) {
            Text("enyaq")
                .font(.bold(size: 40))
                .foregroundStyle(.white)
            
            Spacer()
            
            Image("notification")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
        }
        .padding(.horizontal, 16)
    }
    
    var carImage: some View {
        HStack {
            Spacer()
            
            Image("enyaq")
                .resizable()
                .scaledToFit()
                .frame(height: 231)
                .padding(.top, 38)
        }
    }
    
    var vehicleStatusCard: some View {
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
    }
    
    var subscriptionCard: some View {
        Button {
            path.append(HomeViewNavigation.prepaidServices)
        } label: {
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
                value: "\(viewModel.myPrepaidServicesCount) of \(viewModel.allPrepareidServicesCount) active",
                bottomContent: viewModel.serviceExpiringInLessThanAMonthCount > 0 ? {
                    AnyView(
                        HStack(alignment: .center) {
                            HStack(alignment: .center, spacing: 10) {
                                Circle()
                                    .fill(Color.skodaOrange)
                                    .frame(width: 20, height: 20)
                                    .overlay(
                                        Text("\(viewModel.serviceExpiringInLessThanAMonthCount)")
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
                } : nil
            )
        }
    }
    
    var rangeCard: some View {
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
    }
    
    var temperatureCard: some View {
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
}


#Preview {
    HomeView(selectedTab: .constant(.home))
}

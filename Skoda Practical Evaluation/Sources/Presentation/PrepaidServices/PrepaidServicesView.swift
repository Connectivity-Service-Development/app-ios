//
//  PrepaidServices.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import SwiftUI


struct PrepaidServicesView: View {
    
    // MARK: - Environment
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Input
    
    @Binding var path: NavigationPath
    
    
    // MARK: - State
    
    @StateObject private var viewModel = ViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        LoadableView(
            isLoading: .constant(false),
            error: .constant(nil)
        ) {
            ScrollView {
                VStack(spacing: 0) {
                    NavigationLink {
                        LoadableView(
                            isLoading: .constant(false),
                            error: .constant(nil)
                        ) {
                            ScrollView {
                                
                            }
                            .padding(.bottom, 64)
                            .background(Color.skodaBackground)
                        }
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("Miroslav Udatný")
                                    .font(.bold(size: 20))
                                    .foregroundColor(.white)
                            }
                        }
                    } label: {
                        HStack(alignment: .center) {
                            HStack(alignment: .center, spacing: 8) {
                                Image("avatar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                
                                Text("Miroslav Udatný")
                                    .font(.bold(size: 16))
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                            
                            Image("chevronLeft")
                                .scaleEffect(x: -1, y: 1)
                        }
                        .padding(.top, 8)
                        .padding(.horizontal, 16)
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        VStack {
                            Text("enyaq")
                                .font(.bold(size: 20))
                                .foregroundStyle(.white)
                            
                            Text("vehicles")
                                .font(.regular(size: 16))
                                .foregroundStyle(Color.skodaGrayText)
                        }
                        .padding([.leading, .top, .bottom], 16)
                        
                        Spacer()
                        
                        Image("enyaqFull")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 124, height: 44)
                            .padding(.trailing, 32)
                    }
                    .background(Color.skodaLightGray)
                    .clipShape(RoundedRectangle(cornerRadius: 4, style: .circular))
                    .padding(.top, 26)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 37)
                    
                    ForEach(Array((viewModel.prepaidServices ?? []).enumerated()), id: \.offset) { index, service in
                        Button {
                            path.append(
                                HomeViewNavigation.prepaidServiceDetail(
                                    service,
                                    viewModel.hasUserActiveSubscription(for: service),
                                    (viewModel.myPrepaidServices ?? []).first(where: { $0.id == service.id })?.expirationDate,
                                    viewModel.expirationDateIfNearingExpiration(for: service)
                                )
                            )
                        } label: {
                            VStack(spacing: 19) {
                                HStack(alignment: .center) {
                                    VStack(alignment: .leading) {
                                        Text(service.serviceName.title)
                                            .font(.bold(size: 16))
                                            .foregroundStyle(.white)
                                        
                                        if viewModel.isActiveSubscriptionNearingExpiration(for: service), let expirationDate = viewModel.expirationDateIfNearingExpiration(for: service) {
                                            Text("service_expires_soon")
                                                .font(.regular(size: 12))
                                                .foregroundStyle(Color.skodaOrange)
                                            + Text(" \(expirationDate.formatted(.dateTime.day().month().year()))")
                                                .font(.regular(size: 12))
                                                .foregroundStyle(Color.skodaOrange)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    HStack(alignment: .center) {
                                        if viewModel.hasUserActiveSubscription(for: service) {
                                            Text("active")
                                                .font(.regular(size: 14))
                                                .foregroundStyle(Color.skodaGreen)
                                        } else {
                                            Text("inactive")
                                                .font(.regular(size: 14))
                                                .foregroundStyle(Color.skodaOrange)
                                        }
                                        
                                        Image("chevronLeft")
                                            .scaleEffect(x: -1, y: 1)
                                    }
                                }
                                .padding(.top, index == 0 ? 0 : 19)
                                
                                Color.skodaSeparator
                                    .frame(height: 1)
                                    .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.bottom, 64)
            .background(Color.skodaBackground)
        }
        .task {
            await viewModel.fetchMyPrepaidServices()
            await viewModel.fetchAllPrepaidServices()
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
                Text("Prepaid Services")
                    .font(.bold(size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

extension PrepaidServicesView {
    
    class ViewModel: ObservableObject {
        
        // MARK: - UseCases
        
        private let getMyPrepaidServicesUseCase = inject(GetMyPrepaidServicesUseCase.self)
        private let getAllPrepaidServicesUseCase = inject(GetAllPrepaidServicesUseCase.self)
        
        
        // MARK: - Properties
        
        @Published var prepaidServices: [PrepaidService]?
        @Published var myPrepaidServices: [UserPrepaidService]?
        
        
        // MARK: - Methods
        
        func fetchMyPrepaidServices() async {
            let prepaidServices = await getMyPrepaidServicesUseCase()
            
            switch prepaidServices {
            case .success(let prepaidServices):
                await MainActor.run {
                    self.myPrepaidServices = prepaidServices
                }
            default:
                break
            }
        }
        
        func fetchAllPrepaidServices() async {
            let prepaidServices = await getAllPrepaidServicesUseCase()
            
            switch prepaidServices {
            case .success(let prepaidServices):
                await MainActor.run {
                    self.prepaidServices = prepaidServices
                }
            default:
                break
            }
        }
        
        func isActiveSubscriptionNearingExpiration(for service: PrepaidService) -> Bool {
            guard
                let myPrepaidServices,
                let userPrepaidService = myPrepaidServices.first(where: { $0.id == service.id })
            else {
                return false
            }
            
            let oneMonthFromNow = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
            
            return (userPrepaidService.expirationDate < oneMonthFromNow && !userPrepaidService.expired && userPrepaidService.expirationDate > Date())
        }
        
        func expirationDateIfNearingExpiration(for service: PrepaidService) -> Date? {
            guard
                let myPrepaidServices,
                let userPrepaidService = myPrepaidServices.first(where: { $0.id == service.id })
            else {
                return nil
            }
            
            let oneMonthFromNow = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
            
            return (
                userPrepaidService.expirationDate < oneMonthFromNow &&
                !userPrepaidService.expired &&
                userPrepaidService.expirationDate > Date()
            ) ? userPrepaidService.expirationDate : nil
        }
        
        func hasUserActiveSubscription(for service: PrepaidService) -> Bool {
            guard let myPrepaidServices else {
                return false
            }
            
            return myPrepaidServices.contains { $0.id == service.id && $0.expired == false && $0.expirationDate > Date() }
        }
    }
}

#Preview {
    PrepaidServicesView(path: .constant(NavigationPath()))
}

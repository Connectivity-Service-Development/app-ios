//
//  PrepaidServicePaymentView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 25.10.2024.
//

import SwiftUI


struct PrepaidServicePaymentView: View {
    
    // MARK: - Environment
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Input
    
    @Binding var path: NavigationPath
    
    let prepaidService: PrepaidService
    let expirationDate: Date?
    
    
    // MARK: - State
    
    @StateObject private var viewModel = ViewModel()
    
    
    // MARK: - Computed properties
    
    var beginningOfValidity: String {
        (expirationDate ?? Date()).formatted()
    }
    
    var endOfValidity: String {
        (Calendar.current.date(byAdding: .month, value: 2, to: expirationDate ?? Date()) ?? Date()).formatted()
    }
    
    
    // MARK: - Body
    
    var body: some View {
        LoadableView(
            isLoading: $viewModel.isLoading,
            error: .constant(nil)
        ) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("service")
                        .font(.bold(size: 20))
                        .foregroundStyle(Color.skodaSwitchThumb)
                    
                    VStack(alignment: .leading) {
                        Text(prepaidService.serviceName.title)
                            .font(.bold(size: 20))
                            .foregroundStyle(.white)
                            .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                    }
                    .padding(.top, 22)
                    .padding(.bottom, 40)
                    
                    Text("validity")
                        .font(.bold(size: 20))
                        .foregroundStyle(Color.skodaSwitchThumb)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("period")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text("annual")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                            .padding(.bottom, 19)
                        
                        HStack {
                            Text("beginning_of_validity")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text(beginningOfValidity)
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                            .padding(.bottom, 19)
                        
                        HStack {
                            Text("end_of_validity")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text(endOfValidity)
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                    }
                    .padding(.top, 22)
                    .padding(.bottom, 40)
                    
                    Text("price")
                        .font(.bold(size: 20))
                        .foregroundStyle(Color.skodaSwitchThumb)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("transaction_fee_excluding_vat")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text("5 CZK")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                            .padding(.bottom, 19)
                        
                        HStack {
                            Text("transaction_fee_including_vat")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text("8 CZK")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                            .padding(.bottom, 19)
                        
                        HStack {
                            Text("price_with_vat")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text(prepaidService.price, format: .number.precision(.fractionLength(2)))
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                            + Text(" CZK")
                                .font(.regular(size: 16))
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                    }
                    .padding(.top, 22)
                    .padding(.bottom, 40)
                    
                    Text("total_price")
                        .font(.bold(size: 20))
                        .foregroundStyle(Color.skodaGreen)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(prepaidService.price + 8, format: .number.precision(.fractionLength(2)))
                                .font(.bold(size: 16))
                                .foregroundStyle(.white)
                            + Text(" CZK")
                                .font(.bold(size: 16))
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.bottom, 7)
                        
                        Color.skodaSeparator
                            .frame(height: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 1, style: .circular))
                    }
                    .padding(.top, 22)
                    .padding(.bottom, 40)
                    
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 16) {
                            CapsuleButton(
                                title: "apple_pay",
                                font: .regular(size: 16),
                                icon: Image("applePay"),
                                backgroundColor: Color.skodaButtonBackground,
                                textColor: Color.white,
                                borderColor: .white
                            ) {
                                Task {
                                    await viewModel.orderService(id: prepaidService.id)
                                    
                                    await MainActor.run {
                                        path.append(true)
                                    }
                                }
                            }
                            
                            CapsuleButton(
                                title: "google_pay",
                                font: .regular(size: 16),
                                icon: Image("googlePay"),
                                backgroundColor: Color.skodaButtonBackground,
                                textColor: Color.white,
                                borderColor: .white
                            ) {
                                Task {
                                    await viewModel.orderService(id: prepaidService.id)
                                    
                                    await MainActor.run {
                                        path.append(true)
                                    }
                                }
                            }
                            
                            CapsuleButton(
                                title: "credit_card",
                                font: .regular(size: 16),
                                icon: nil,
                                backgroundColor: Color.skodaButtonBackground,
                                textColor: Color.white,
                                borderColor: .white
                            ) {
                                Task {
                                    await viewModel.orderService(id: prepaidService.id)
                                    
                                    await MainActor.run {
                                        path.append(true)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
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
                Text("purchase_summary")
                    .font(.bold(size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    PrepaidServicePaymentView(
        path: .constant(NavigationPath()),
        prepaidService: .init(
            id: "1",
            serviceName: .infotainmentOnline,
            description: "Test",
            bulletPoints: ["Test"],
            price: 0
        ),
        expirationDate: nil
    )
}

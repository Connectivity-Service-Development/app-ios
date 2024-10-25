//
//  PrepaidServicePaymentSuccessView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 25.10.2024.
//

import SwiftUI

struct PrepaidServicePaymentSuccessView: View {
    
    // MARK: - Input
    
    @Binding var path: NavigationPath
    
    
    // MARK: - Body
    
    var body: some View {
        LoadableView(
            isLoading: .constant(false),
            error: .constant(nil)
        ) {
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                
                Image("success")
                    .resizable()
                    .frame(width: 122, height: 122)
                    .padding(.bottom, 16)
                
                Text("payment_success")
                    .font(.bold(size: 20))
                    .foregroundStyle(.white)
                
                Text("payment_success_description")
                    .font(.regular(size: 16))
                    .foregroundStyle(Color.skodaGrayText)
                    .padding(.bottom, 214)
                
                HStack {
                    Spacer()
                    
                    CapsuleButton(
                        title: "PDF Receipt",
                        font: .bold(size: 16), icon: nil,
                        backgroundColor: .skodaGreen,
                        textColor: .skodaBackground,
                        borderColor: nil
                    ) {
                        
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
                HStack {
                    Spacer()
                    
                    CapsuleButton(
                        title: "Close",
                        font: .bold(size: 16), icon: nil,
                        backgroundColor: .skodaButtonBackground,
                        textColor: .white,
                        borderColor: .skodaSeparator
                    ) {
                        path.removeLast(3)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 64)
            .background(Color.skodaBackground)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PrepaidServicePaymentSuccessView(path: .constant(.init()))
}

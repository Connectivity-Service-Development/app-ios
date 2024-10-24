//
//  SubscriptionsView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import SwiftUI


struct SubscriptionsView: View {
    
    // MARK: - Environment
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Body
    
    var body: some View {
        LoadableView(
            isLoading: .constant(false),
            error: .constant(nil)
        ) {
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Text("Test")
                        Spacer()
                    }
                    
                    Spacer()
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
                Text("Subscriptions")
                    .font(.bold(size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    SubscriptionsView()
}

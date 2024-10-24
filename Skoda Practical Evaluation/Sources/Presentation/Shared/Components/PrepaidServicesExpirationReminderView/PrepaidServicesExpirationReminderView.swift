//
//  PrepaidServicesExpirationReminderView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import SwiftUI


struct PrepaidServicesExpirationReminderView: View {
    
    // MARK: - Input
    
    @Binding var hideExpirationReminderBanner: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("connected_services_expiration_reminders_title")
                .font(.regular(size: 14))
                .foregroundStyle(.white)
                .padding([.leading, .top, .trailing], 16)
                .padding(.bottom, 8)
            
            HStack(spacing: 0) {
                Spacer()
                
                HStack(spacing: 8) {
                    Button {
                        hideExpirationReminderBanner = true
                    } label: {
                        Text("connected_services_expiration_reminders_remind_me")
                            .font(.bold(size: 14))
                            .foregroundStyle(Color.skodaGreen)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                    }
                                        
                    Button {
                        
                    } label: {
                        Text("connected_services_expiration_reminders_browse")
                            .font(.bold(size: 14))
                            .foregroundStyle(Color.skodaGreen)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                    }
                }
                .padding(.trailing, 16)
            }
            .padding(.bottom, 16)
        }
        .background(Color.skodaLightGray)
    }
}

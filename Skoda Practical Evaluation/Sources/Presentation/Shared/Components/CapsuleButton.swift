//
//  CapsuleButton.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import SwiftUI


struct CapsuleButton: View {
    
    let title: LocalizedStringKey
    let font: Font
    let icon: Image?
    let backgroundColor: Color
    let textColor: Color
    let borderColor: Color?
    let action: () -> Void
    
    var unwrappedBorderColor: Color {
        borderColor ?? .clear
    }
    
    var borderWidth: CGFloat {
        borderColor != nil ? 1 : 0
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Capsule()
                .fill(backgroundColor)
                .strokeBorder(unwrappedBorderColor, lineWidth: borderWidth)
                .frame(width: 216, height: 44)
                .overlay(
                    HStack(alignment: .center, spacing: 14) {
                        if let icon {
                            icon
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        
                        Text(title)
                            .font(font)
                            .foregroundStyle(textColor)
                    },
                    alignment: .center
                )
        }
    }
}

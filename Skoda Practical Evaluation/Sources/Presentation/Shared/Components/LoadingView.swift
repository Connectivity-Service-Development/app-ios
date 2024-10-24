//
//  LoadingView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import SwiftUI


struct LoadingView: View {
    var body: some View {
        Color.white
            .opacity(0.1)
            .overlay(
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            )
            .ignoresSafeArea()
    }
}


#Preview {
    LoadingView()
}

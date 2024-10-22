//
//  LoadingView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import SwiftUI


struct LoadingView: View {
    var body: some View {
        Color.black
            .opacity(0.1)
            .overlay(
                ProgressView()
                    .progressViewStyle(.circular)
            )
            .ignoresSafeArea()
    }
}


#Preview {
    LoadingView()
}

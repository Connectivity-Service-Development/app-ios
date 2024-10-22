//
//  ContentView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import SwiftUI

struct DummyView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        LoadableView(
            isLoading: $viewModel.isLoading,
            error: $viewModel.error
        ) {
            VStack {
                if let dummy = viewModel.dummy {
                    Text(dummy.text)
                }
            }
        }
        .task {
            await viewModel.fetchDummy()
        }
    }
}

#Preview {
    DummyView()
}

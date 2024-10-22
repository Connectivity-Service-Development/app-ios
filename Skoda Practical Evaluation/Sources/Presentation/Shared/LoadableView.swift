//
//  LoadableView.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import SwiftUI


public struct LoadableViewError: Identifiable {
    public var id = UUID()
    var message: LocalizedStringKey
}


public struct LoadableView<Content>: View where Content: View {

    var content: Content
    @Binding var isLoading: Bool
    @Binding var error: LoadableViewError?

    public init(
        isLoading: Binding<Bool>? = nil,
        error: Binding<LoadableViewError?>? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self._isLoading = isLoading ?? .constant(false)
        self._error = error ?? .constant(nil)
        self.content = content()
    }

    public var body: some View {
        ZStack {
            content

            if isLoading == true {
                LoadingView()
            }
        }
        .alert(item: $error) { error in
            Alert(title: Text(""), message: Text(error.message), dismissButton: .default(Text("OK")))
        }
    }
}


#Preview {
    LoadableView(isLoading: .constant(true)) {
        Text("Hello, World!")
    }
}

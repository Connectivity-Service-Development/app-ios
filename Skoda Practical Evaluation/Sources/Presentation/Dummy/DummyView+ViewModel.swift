//
//  ContentView+ViewModel.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


extension DummyView {
    
    class ViewModel: ObservableObject {
        
        // MARK: - UseCases
        
        private let getDummyUseCase = inject(GetDummyUseCase.self)
        
        
        // MARK: - Properties
        
        @Published var dummy: Dummy?
        @Published var isLoading = false
        @Published var error: LoadableViewError?
        
        
        // MARK: - Methods
        
        func fetchDummy() async {
            await MainActor.run {
                self.isLoading = true
            }
            
            let dummy = await getDummyUseCase()
            
            switch dummy {
            case .success(let dummy):
                await MainActor.run {
                    self.dummy = dummy
                    self.isLoading = false
                }
            case .failure:
                await MainActor.run {
                    self.isLoading = false
                    self.error = LoadableViewError(message: "common_error")
                }
            }
        }
    }
}

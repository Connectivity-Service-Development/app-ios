//
//  SettingsView+ViewModel.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


extension SettingsView {
    
    class ViewModel: ObservableObject {
        
        // MARK: - UseCases
        
        private let resetUseCase = inject(ResetUseCase.self)
        
        
        // MARK: - Properties
        
        @Published var isLoading = false
        
        
        // MARK: - Methods
        
        func reset() async {
            await MainActor.run {
                self.isLoading = true
            }
            
            let result = await resetUseCase()
            
            switch result {
            case .success:
                await MainActor.run {
                    self.isLoading = false
                }
            case .failure:
                await MainActor.run {
                    self.isLoading = false
                }
            }
        }
    }
}

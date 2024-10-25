//
//  PrepaidServicePaymentView+ViewModel.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 25.10.2024.
//

import Foundation


extension PrepaidServicePaymentView {
    
    class ViewModel: ObservableObject {
            
        // MARK: - UseCases
        
        private let orderPrepaidServiceUseCase = inject(OrderPrepaidServiceUseCase.self)
        
        
        // MARK: - Properties
        
        @Published var isLoading = false
        
        
        // MARK: - Methods
        
        func orderService(id: String) async {
            await MainActor.run {
                self.isLoading = true
            }
            
            let result = await orderPrepaidServiceUseCase(id: id)
            
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

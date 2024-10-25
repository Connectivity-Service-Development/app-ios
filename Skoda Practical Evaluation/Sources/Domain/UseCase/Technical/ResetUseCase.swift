//
//  ResetUseCase.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


protocol ResetUseCase {
    func callAsFunction() async -> Result<Void, Error>
}


struct ResetUseCaseImpl: ResetUseCase {
    
    let dataSource: TechnicalDataSource
    
    func callAsFunction() async -> Result<Void, Error> {
        do {
            return .success(try await dataSource.reset())
        } catch {
            return .failure(error)
        }
    }
}

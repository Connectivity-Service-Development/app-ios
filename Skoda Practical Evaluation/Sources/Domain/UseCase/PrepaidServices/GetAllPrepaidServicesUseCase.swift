//
//  GetAllPrepaidServicesUseCase.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


protocol GetAllPrepaidServicesUseCase {
    func callAsFunction() async -> Result<[PrepaidService], Error>
}


struct GetAllPrepaidServicesUseCaseImpl: GetAllPrepaidServicesUseCase {
    
    let dataSource: PrepaidServicesDataSource
    
    func callAsFunction() async -> Result<[PrepaidService], Error> {
        do {
            return .success(try await dataSource.getAllPrepaidServices())
        } catch {
            return .failure(error)
        }
    }
}

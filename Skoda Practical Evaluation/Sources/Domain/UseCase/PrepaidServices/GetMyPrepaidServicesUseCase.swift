//
//  GetMyPrepaidServicesUseCase.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


protocol GetMyPrepaidServicesUseCase {
    func callAsFunction() async -> Result<[UserPrepaidService], Error>
}


struct GetMyPrepaidServicesUseCaseImpl: GetMyPrepaidServicesUseCase {
    
    let dataSource: PrepaidServicesDataSource
    
    func callAsFunction() async -> Result<[UserPrepaidService], Error> {
        do {
            return .success(try await dataSource.getMyPrepaidServices())
        } catch {
            return .failure(error)
        }
    }
}

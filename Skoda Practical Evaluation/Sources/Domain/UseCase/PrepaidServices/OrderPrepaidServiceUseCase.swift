//
//  OrderPrepaidServiceUseCase.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


protocol OrderPrepaidServiceUseCase {
    func callAsFunction(id: String) async -> Result<Void, Error>
}


struct OrderPrepaidServiceUseCaseImpl: OrderPrepaidServiceUseCase {
    
    let dataSource: PrepaidServicesDataSource
    
    func callAsFunction(id: String) async -> Result<Void, Error> {
        do {
            return .success(try await dataSource.orderPrepaidService(id: id))
        } catch {
            return .failure(error)
        }
    }
}

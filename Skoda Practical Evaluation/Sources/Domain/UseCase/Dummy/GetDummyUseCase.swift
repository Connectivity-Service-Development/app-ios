//
//  GetDummyUseCase.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//


import Foundation


protocol GetDummyUseCase {
    func callAsFunction() async -> Result<Dummy, Error>
}


struct GetDummyUseCaseImpl: GetDummyUseCase {
    let repository: DummyRepository
    
    func callAsFunction() async -> Result<Dummy, Error> {
        do {
            return .success(try await repository.getDummy())
        } catch {
            return .failure(error)
        }
    }
}

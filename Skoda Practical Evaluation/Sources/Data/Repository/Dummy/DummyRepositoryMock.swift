//
//  DummyRepositoryMock.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


class DummyRepositoryMock: DummyRepository {
    
    let dataSource: DummyDataSource
    
    init(dataSource: DummyDataSource) {
        self.dataSource = dataSource
    }
    
    func getDummy() async throws -> Dummy {
        return try await dataSource.getDummy()
    }
}

//
//  DummyDataSourceMock.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


class DummyDataSourceMock: DummyDataSource {
    
    func getDummy() async throws -> Dummy {
        try await Task.sleep(for: .seconds(1))
        let dto = DummyDTO(text: "Mock Hello World!")
        return dto.toEntity()
    }
}

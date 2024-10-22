//
//  DummyDataSourceRemote.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


class DummyDataSourceRemote: DummyDataSource {
    
    func getDummy() async throws -> Dummy {
        try await Task.sleep(for: .seconds(1))
        let dto = DummyDTO(text: "Remote Hello World!")
        return dto.toEntity()
    }
}

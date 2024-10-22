//
//  DummyDTO.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


struct DummyDTO {
    let text: String
}


// MARK: - Mapping

extension DummyDTO {
    func toEntity() -> Dummy {
        return .init(text: text)
    }
}

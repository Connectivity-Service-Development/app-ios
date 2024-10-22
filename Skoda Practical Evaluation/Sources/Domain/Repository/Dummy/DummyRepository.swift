//
//  DummyRepository.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


protocol DummyRepository {
    func getDummy() async throws -> Dummy
}

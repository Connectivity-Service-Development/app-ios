//
//  TechnicalDataSource.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


protocol TechnicalDataSource {
    func reset() async throws -> Void
}

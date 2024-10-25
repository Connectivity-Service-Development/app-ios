//
//  PrepaidServiceDTO.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


struct PrepaidServiceDTO: Decodable {
    let id: String
    let serviceName: String
    let description: String
    let bulletPoints: [String]
    let price: Double
}


// MARK: - Mapping

extension PrepaidServiceDTO {
    func toEntity() throws -> PrepaidService {
        return .init(
            id: id,
            serviceName: PrepaidServiceName(rawValue: serviceName)!,
            description: description,
            bulletPoints: bulletPoints,
            price: price
        )
    }
}

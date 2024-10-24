//
//  UserPrepaidServiceDTO.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


struct UserPrepaidServiceDTO: Decodable {
    let id: Int
    let serviceName: String
    let expirationDate: String
    let expired: Bool
}


// MARK: - Mapping

extension UserPrepaidServiceDTO {
    func toEntity() throws -> UserPrepaidService {
        return .init(
            id: id,
            serviceName: serviceName,
            expirationDate: try Date(expirationDate, strategy: .dateTime.year().month().day()),
            expired: expired
        )
    }
}

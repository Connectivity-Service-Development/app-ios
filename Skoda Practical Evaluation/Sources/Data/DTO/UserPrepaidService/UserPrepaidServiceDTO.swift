//
//  UserPrepaidServiceDTO.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


enum DateConversionError: Error {
    case invalidDateFormat
}


struct UserPrepaidServiceDTO: Decodable {
    let prepaidServiceId: String
    let serviceName: String
    let expirationDate: String
    let expired: Bool
}


// MARK: - Mapping

extension UserPrepaidServiceDTO {
    func toEntity() throws -> UserPrepaidService {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let date = dateFormatter.date(from: expirationDate) else {
            throw DateConversionError.invalidDateFormat
        }
        
        return UserPrepaidService(
            id: prepaidServiceId,
            serviceName: serviceName,
            expirationDate: date,
            expired: expired
        )
    }
}

//
//  PrepaidServicesDataSourceMock.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


class PrepaidServicesDataSourceMock: PrepaidServicesDataSource {
    
    func getMyPrepaidServices() async throws -> [UserPrepaidService] {
        try await Task.sleep(for: .seconds(1))
        
        let dtos = [
            UserPrepaidServiceDTO(
                id: 1,
                serviceName: "Service 1",
                expirationDate: "2022-11-22T12:49:02.932423",
                expired: true
            ),
            UserPrepaidServiceDTO(
                id: 2,
                serviceName: "Service 2",
                expirationDate: "2022-11-22T12:49:02.932423",
                expired: true
            ),
            UserPrepaidServiceDTO(
                id: 3,
                serviceName: "Service 3",
                expirationDate: "2022-11-22T12:49:02.932423",
                expired: true
            )
        ]
        
        return try dtos.map { try $0.toEntity() }
    }
}

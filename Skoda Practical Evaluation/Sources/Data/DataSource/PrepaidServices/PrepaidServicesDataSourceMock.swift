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
                prepaidServiceId: "1",
                serviceName: "Service 1",
                expirationDate: "2022-11-22T12:49:02.932423",
                expired: true
            ),
            UserPrepaidServiceDTO(
                prepaidServiceId: "2",
                serviceName: "Service 2",
                expirationDate: "2022-11-22T12:49:02.932423",
                expired: true
            ),
            UserPrepaidServiceDTO(
                prepaidServiceId: "3",
                serviceName: "Service 3",
                expirationDate: "2022-11-22T12:49:02.932423",
                expired: true
            )
        ]
        
        return try dtos.map { try $0.toEntity() }
    }
    
    func getAllPrepaidServices() async throws -> [PrepaidService] {
        try await Task.sleep(for: .seconds(1))
        
        let dtos = [
            PrepaidServiceDTO(
                id: "1",
                serviceName: "Service 1",
                description: "Description 1",
                bulletPoints: ["Point 1", "Point 2", "Point 3"],
                price: 100
            )
        ]
        
        return try dtos.map { try $0.toEntity() }
    }
    
    func orderPrepaidService(id: String) async throws {
        try await Task.sleep(for: .seconds(1))
    }
}

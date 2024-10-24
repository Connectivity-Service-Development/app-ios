//
//  PrepaidServicesDataSourceRemote.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import Foundation


class PrepaidServicesDataSourceRemote: PrepaidServicesDataSource {
    
    func getMyPrepaidServices() async throws -> [UserPrepaidService] {
        guard let url = URL(string: "https://backend-service-7snj9.ondigitalocean.app/api/prepaid-services") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let dtos = try JSONDecoder().decode([UserPrepaidServiceDTO].self, from: data)
        
        return try dtos.map { try $0.toEntity() }
    }
}

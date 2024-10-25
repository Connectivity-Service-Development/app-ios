//
//  TechnicalDataSourceRemote.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


class TechnicalDataSourceRemote: TechnicalDataSource {
    
    func getMyPrepaidServices() async throws -> [UserPrepaidService] {
        guard let url = URL(string: "https://backend-service-7snj9.ondigitalocean.app/api/prepaid-services/user") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let dtos = try JSONDecoder().decode([UserPrepaidServiceDTO].self, from: data)
        
        return try dtos.map { try $0.toEntity() }
    }
    
    func reset() async throws {
        guard let url = URL(string: "https://backend-service-7snj9.ondigitalocean.app/api/technical") else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        let (_, _) = try await URLSession.shared.data(for: urlRequest)
    }
}

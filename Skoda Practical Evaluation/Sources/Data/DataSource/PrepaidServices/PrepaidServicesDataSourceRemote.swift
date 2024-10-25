//
//  PrepaidServicesDataSourceRemote.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 23.10.2024.
//

import Foundation


class PrepaidServicesDataSourceRemote: PrepaidServicesDataSource {
    
    func getMyPrepaidServices() async throws -> [UserPrepaidService] {
        guard let url = URL(string: "https://backend-service-7snj9.ondigitalocean.app/api/prepaid-services/user") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let dtos = try JSONDecoder().decode([UserPrepaidServiceDTO].self, from: data)
        
        return try dtos.map { try $0.toEntity() }
    }
    
    func getAllPrepaidServices() async throws -> [PrepaidService] {
        guard let url = URL(string: "https://backend-service-7snj9.ondigitalocean.app/api/prepaid-services/all") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let dtos = try JSONDecoder().decode([PrepaidServiceDTO].self, from: data)
        
        return try dtos.map { try $0.toEntity() }
    }
    
    func orderPrepaidService(id: String) async throws {
        guard let url = URL(string: "https://backend-service-7snj9.ondigitalocean.app/api/prepaid-services/prolong") else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try JSONEncoder().encode(["serviceId": id])
        
        let (_, _) = try await URLSession.shared.data(for: urlRequest)
    }
}

//
//  PrepaidService.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import Foundation


struct PrepaidService: Hashable {
    let id: String
    let serviceName: PrepaidServiceName
    let description: String
    let bulletPoints: [String]
    let price: Double
}

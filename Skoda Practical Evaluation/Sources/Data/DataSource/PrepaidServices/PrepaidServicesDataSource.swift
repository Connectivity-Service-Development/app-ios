//
//  PrepaidServicesDataSource.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


protocol PrepaidServicesDataSource {
    func getMyPrepaidServices() async throws -> [UserPrepaidService]
}

//
//  RemoteDataSourceAssembly.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Swinject


class RemoteDataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PrepaidServicesDataSource.self) { _ in
            PrepaidServicesDataSourceRemote()
        }
        
        container.register(TechnicalDataSource.self) { _ in
            TechnicalDataSourceRemote()
        }
    }
}

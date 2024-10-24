//
//  RemoteDataSourceAssembly.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Swinject


class RemoteDataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DummyDataSource.self) { _ in
            DummyDataSourceRemote()
        }
        
        container.register(PrepaidServicesDataSource.self) { _ in
            PrepaidServicesDataSourceRemote()
        }
    }
}

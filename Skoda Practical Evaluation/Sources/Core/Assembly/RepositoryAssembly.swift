//
//  RepositoryAssembly.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Swinject


class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DummyRepository.self) { resolver in
            DummyRepositoryMock(dataSource: resolver.resolve(DummyDataSource.self)!)
        }
    }
}

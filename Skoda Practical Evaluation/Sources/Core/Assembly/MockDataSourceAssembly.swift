//
//  DataSourceAssembly.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Swinject


class MockDataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(DummyDataSource.self) { _ in
            DummyDataSourceMock()
        }
    }
}

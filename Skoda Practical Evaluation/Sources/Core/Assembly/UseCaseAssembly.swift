//
//  UseCaseAssembly.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Swinject


class UseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(GetDummyUseCase.self) { resolver in
            GetDummyUseCaseImpl(dataSource: inject())
        }
        
        container.register(GetMyPrepaidServicesUseCase.self) { resolver in
            GetMyPrepaidServicesUseCaseImpl(dataSource: inject())
        }
    }
}

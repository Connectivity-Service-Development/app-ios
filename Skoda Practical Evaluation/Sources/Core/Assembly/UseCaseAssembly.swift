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
        
        container.register(GetAllPrepaidServicesUseCase.self) { resolver in
            GetAllPrepaidServicesUseCaseImpl(dataSource: inject())
        }
        
        container.register(ResetUseCase.self) { resolver in
            ResetUseCaseImpl(dataSource: inject())
        }
        
        container.register(OrderPrepaidServiceUseCase.self) { resolver in
            OrderPrepaidServiceUseCaseImpl(dataSource: inject())
        }
    }
}

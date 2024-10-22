//
//  Functions.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Swinject


fileprivate let assembler: Assembler = {
    let container = Container()
            
    return Assembler([
        dataSourceAssembly(),
        RepositoryAssembly(),
        UseCaseAssembly(),
    ], container: container)
}()

fileprivate func dataSourceAssembly() -> Assembly {
    if AppConfig.shared.valueForKey("ENVIRONMENT") == "MOCK" {
        return MockDataSourceAssembly()
    } else {
        return RemoteDataSourceAssembly()
    }
}

func inject<Service>(_ serviceType: Service.Type) -> Service {
    return assembler.resolver.resolve(serviceType)!
}

func inject<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
    assembler.resolver.resolve(serviceType, argument: argument)!
}

func inject<Service, Arg1, Arg2>(_ serviceType: Service.Type, arguments argument1: Arg1, _ argument2: Arg2) -> Service {
    assembler.resolver.resolve(serviceType, arguments: argument1, argument2)!
}

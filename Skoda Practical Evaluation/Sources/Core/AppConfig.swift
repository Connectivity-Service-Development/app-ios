//
//  Environment.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


public class AppConfig {
    
    public static let shared = AppConfig()
    
    fileprivate var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist file not found")
        }
    }

    public func valueForKey(_ key: String) -> String {
        let value = infoDict["\(key)"] as? String
        
        if value == nil {
            fatalError("Enviroment error")
        }
        
        return value!
    }
}

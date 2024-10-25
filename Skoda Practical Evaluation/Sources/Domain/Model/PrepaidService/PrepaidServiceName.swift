//
//  PrepaidServiceName.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import SwiftUI


enum PrepaidServiceName: String {
    
    case infotainmentOnline = "INFOTAINMENT_ONLINE"
    case remoteAccess = "REMOTE_ACCESS"
    case travelAssist = "TRAVEL_ASSIST"
    case mediaStreaming = "MEDIA_STREAMING"
    case intelligentSpeedAssist = "INTELLIGENT_SPEED_ASSIST"
    case traffication = "TRAFFICATION"
    
    var title: LocalizedStringKey {
        switch self {
        case .infotainmentOnline:
            return "infotainment_online"
        case .remoteAccess:
            return "remote_access"
        case .travelAssist:
            return "travel_assist"
        case .mediaStreaming:
            return "media_streaming"
        case .intelligentSpeedAssist:
            return "intelligent_speed_assist"
        case .traffication:
            return "traffication"
        }
    }
}

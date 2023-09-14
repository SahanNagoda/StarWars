//
//  Environment.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import Foundation

enum Environment {
    
    case Dev
    case QA
    case Staging
    case Prod
    
    var baseURL: String {
        switch NetworkManager.environment {
        case .Dev:
            return Config.API.DEV.HOST
        case .QA:
            return Config.API.QA.HOST
        case .Staging:
            return Config.API.STAGING.HOST
        case .Prod:
            return Config.API.LIVE.HOST
        }
    }
}

struct NetworkManager {
    #if DEBUG
    static let environment: Environment = .Dev
    #elseif RELEASE
    static let environment: Environment = .Prod
    #endif
}



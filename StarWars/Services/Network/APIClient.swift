//
//  APIClient.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import Foundation

class APIClient: NSObject {
    
    override init() {
        super.init()
    }
    
    static let sharedClient : APIClient = {
        let instance = APIClient()
        return instance
    }()
    
    public func environment() -> Environment {
        // To change the pointed environment, change the below enum to Development and Production accordingly.
        return Environment.Dev
    }
    
    public func baseURL() -> String {
        switch (APIClient.sharedClient.environment()) {
        case .Dev:
            return Config.API.DEV.HOST
        case .Prod:
            return Config.API.LIVE.HOST
        case .Staging:
            return Config.API.STAGING.HOST
        case .QA:
            return Config.API.QA.HOST
        }
    }
}

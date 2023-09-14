//
//  PlanetAPI.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import Foundation
import Moya

enum PlanetAPI {
    case getAllPlanets(page: Int)
    case getPlanetDetails(id: Int)
}

extension PlanetAPI: TargetType {
    
    public var environment: Environment {
        NetworkManager.environment
    }
    
    var baseURL: URL {
        guard let url = URL(string: environment.baseURL) else { fatalError("base url not configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .getAllPlanets:
            return "/planets"
        case .getPlanetDetails(id: let id):
            return "/planets/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllPlanets, .getPlanetDetails:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getAllPlanets(page: let page):
            return .requestParameters(
                parameters: [ "page": page ], encoding: URLEncoding.queryString)
        case .getPlanetDetails:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let params = [
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
        
        return params
    }
    
    
}

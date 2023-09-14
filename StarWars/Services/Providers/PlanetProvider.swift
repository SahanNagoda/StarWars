//
//  PlanetProvider.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import Foundation
import Combine
import Moya
import CombineMoya

protocol PlanetDataProvider {
    func getPlanetsPublisher(page: Int) -> AnyPublisher<PlanetsResponse, Error>
}

extension MoyaProvider: PlanetDataProvider where Target == PlanetAPI {

    
    func getPlanetsPublisher(page: Int) -> AnyPublisher<PlanetsResponse, Error> {
        requestPublisher(.getAllPlanets(page: page))
            .map(\.data)
            .decode(type: PlanetsResponse.self, decoder: JSONDecoder())
            .flatMap { response -> AnyPublisher<PlanetsResponse, Error> in
                return Just(response)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}

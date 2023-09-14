//
//  PlanetsViewModel.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import Foundation
import Moya
import Combine

class PlanetsViewModel: ObservableObject {
    private let planetsProvider: PlanetDataProvider
    
    @Published var planets: [Planet] = []
    @Published var isLoading: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    private var planetCount: Int?
    private var currentPage: Int = 1
    
    init(
        planetsProvider: PlanetDataProvider = MoyaProvider<PlanetAPI>()
    ) {
        self.planetsProvider = planetsProvider
    }
}

extension PlanetsViewModel {
    func fetchPlanets() {
        isLoading = true
        self.planetsProvider
            .getPlanetsPublisher(page: currentPage)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    guard case let .failure(error) = completion else { return }
                    print(error)
                },
                receiveValue: { [weak self] data in

                    self?.planets.append(contentsOf: data.results)
                    self?.planetCount = data.count
                }
            )
            .store(in: &subscriptions)
    }
    
    /// Load next page after fourth from last item appeared
    /// - Parameter planet:  latest appeared item
    func planetItemAppeared(planet: Planet) {
        if let planetCount = planetCount, planet == planets[planets.count - 5] && planetCount > planets.count {
            currentPage += 1
            fetchPlanets()
        }
    }
}

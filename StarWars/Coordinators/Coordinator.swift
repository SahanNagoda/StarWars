//
//  Coordinator.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import SwiftUI

enum Page: Hashable, Equatable {
    
    case planets
    case planetDetail(planet: Planet)
    case splash
}


class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .planets:
            PlanetsView()
        case .planetDetail(planet: let planet):
            PlanetDetailView(planet: planet )
        case .splash:
            SplashView()
        }
    }
}

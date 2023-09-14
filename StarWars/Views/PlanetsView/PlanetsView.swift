//
//  PlanetsView.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import SwiftUI

struct PlanetsView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    @StateObject
    private var _viewModel: PlanetsViewModel
    
    init(viewModel: PlanetsViewModel = .init()) {
        self.__viewModel = StateObject<PlanetsViewModel>(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            listViewSection()
                .navigationTitle("Planets")
        }
        .onAppear {
            if _viewModel.planets.count == 0 {
                _viewModel.fetchPlanets()
            }
        }
        .overlay(loadingView, alignment: .center)
    }
    
    private var loadingView: some View {
        if _viewModel.planets.count == 0 {
            return AnyView(
                LottieView(lottieFile: "animation_loading", isLooped: true)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
}

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsView()
    }
}

extension PlanetsView {
    private func listViewSection() -> some View {
        List{
            ForEach(_viewModel.planets){ planet in
                PlanetRow(planet: planet)
                    .onAppear {
                        _viewModel.planetItemAppeared(planet: planet)
                    }
                    .onTapGesture {
                        coordinator.push(page: .planetDetail(planet: planet))
                    }
            }
            
            if _viewModel.planets.count > 0 && _viewModel.isLoading{
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
        }
    }
}

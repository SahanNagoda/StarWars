//
//  PlanetDetailView.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import SwiftUI
import Kingfisher

struct PlanetDetailView: View {
    let planet: Planet
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(planet.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    KFImage(URL(string: "https://picsum.photos/id/56/50/50")!)
                    
                }
                .ignoresSafeArea(.all)
                
                Divider()
                
                Group {
                    InfoRow(title: "Rotation Period", value: planet.rotationPeriod)
                    InfoRow(title: "Orbital Period", value: planet.orbitalPeriod)
                    InfoRow(title: "Diameter", value: planet.diameter)
                    InfoRow(title: "Climate", value: planet.climate)
                    InfoRow(title: "Gravity", value: planet.gravity)
                    InfoRow(title: "Terrain", value: planet.terrain)
                    InfoRow(title: "Surface Water", value: planet.surfaceWater)
                    InfoRow(title: "Population", value: planet.population)
                }
                .padding(.vertical, 5)
                
                Divider()
                
                Text("Residents:")
                    .font(.headline)
                
                ForEach(planet.residents, id: \.self) { residentURL in
                    Link(destination: URL(string: residentURL) ?? URL(string: residentURL)!) {
                        Text(residentURL)
                            .font(.subheadline)
                    }
                }
                
                Divider()
                
                Text("Films:")
                    .font(.headline)
                
                ForEach(planet.films, id: \.self) { filmURL in
                    Link(destination: URL(string: filmURL) ?? URL(string: filmURL)!) {
                        Text(filmURL)
                            .font(.subheadline)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct PlanetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePlanet = Planet(
            name: "Geonosis",
            rotationPeriod: "30",
            orbitalPeriod: "256",
            diameter: "11370",
            climate: "temperate, arid",
            gravity: "0.9 standard",
            terrain: "rock, desert, mountain, barren",
            surfaceWater: "5",
            population: "100000000000",
            residents: ["https://swapi.dev/api/people/63/"],
            films: ["https://swapi.dev/api/films/5/"],
            created: "2014-12-10T12:47:22.350000Z",
            edited: "2014-12-20T20:58:18.437000Z",
            url: "https://swapi.dev/api/planets/11/"
        )
        PlanetDetailView(planet: samplePlanet)
    }
}


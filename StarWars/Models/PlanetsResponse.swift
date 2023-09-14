//
//  PlanetsResponse.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//


struct PlanetsResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}

struct Planet: Codable, Identifiable, Equatable, Hashable {
    
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
    
    var id: String {
        self.name
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created
        case edited
        case url
    }
}


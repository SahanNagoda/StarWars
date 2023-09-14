//
//  PlanetRow.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import SwiftUI

struct PlanetRow: View {
    
    let planet: Planet
    
    var body: some View {
        HStack {
            Text(planet.name)
            Spacer()
            Text(planet.climate)
                .foregroundColor(Color.gray)
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
        }
        
    }
}

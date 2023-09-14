//
//  InfoRow.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import SwiftUI

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.subheadline)
        }
    }
}


struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(title: "Rotation Perio", value: "30")
    }
}

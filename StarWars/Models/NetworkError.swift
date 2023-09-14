//
//  NetworkError.swift
//  StarWars
//
//  Created by Sahan Nagodavithana on 9/14/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case generic
    case connection
    case decodingError
    case custom(description: String)

    var errorDescription: String? {
        switch self {
        case .generic:
            return "Something went wrong"
        case .connection, .decodingError:
            return "We're having trouble connecting to the server, please try again"

        case let .custom(description):
            return description
        }
    }
}

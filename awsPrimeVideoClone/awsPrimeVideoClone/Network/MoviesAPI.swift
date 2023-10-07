//
//  MoviesAPI.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import Foundation
//case trending
//case topTen
//case series
//case recommended
//case turkishMovies

extension API {
    enum Endpoints {
        case trending
        case topMovies
        case topSeries
        case turkishMovies

        var path: String {
            switch self {
            case .trending:
                return "/trending/all/week"
            case .topMovies:
                return "/movie/top_rated"
            case .topSeries:
                return "/tv/top_rated"
            case .turkishMovies:
                return "discover/movie"
            }
        }

        var queryParameters: [URLQueryItem] {
            switch self {
            case .trending:
                return [URLQueryItem(name: "page", value: "1")]
                
            case .topMovies, .topSeries:
                return [URLQueryItem(name: "language", value: "en-US"),
                        URLQueryItem(name: "page", value: "1")]
                
            case .turkishMovies:
                return [URLQueryItem(name: "with_original_language", value: "tr"),
                        URLQueryItem(name: "page", value: "1")]
            }
        }

        var headers: [String: String] {
            return API.headers
        }
        
        var url: URL {
            var components = URLComponents(url: API.baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)!
            components.queryItems = queryParameters
            return components.url!
        }
    }
}

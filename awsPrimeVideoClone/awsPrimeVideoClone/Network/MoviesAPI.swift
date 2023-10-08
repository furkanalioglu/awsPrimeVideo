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
        case getMovieTrailer(query: String)

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
            case .getMovieTrailer(query: _):
                return ""
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
            case .getMovieTrailer(let query):
                return [
                    URLQueryItem(name: "q", value: query),
                    URLQueryItem(name: "type", value: "video"),
                    URLQueryItem(name: "key", value: API.youtubeApiKey),
                    URLQueryItem(name: "part", value: "snippet")
                ]
            }
        }

        var headers: [String: String] {
            switch self {
            case .getMovieTrailer:
                return [:]
            default:
                return API.headers
            }

        }
        
        var url: URL {
            switch self {
            case .getMovieTrailer:
                var components = URLComponents(url: (API.youtubeApiBaseURL?.appendingPathComponent(path))!, resolvingAgainstBaseURL: true)!
                components.queryItems = queryParameters
                return components.url!

            default:
                var components = URLComponents(url: API.baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)!
                components.queryItems = queryParameters
                return components.url!
            }
        }
    }
}

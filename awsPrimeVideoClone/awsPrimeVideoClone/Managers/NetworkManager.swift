//
//  NetworkManager.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 4.10.2023.
//

import Foundation


struct APIError: Error, Decodable {
    let statusMessage: String?
    let statusCode: Int?
}

final 
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMovies(from category: MovieCategory) async throws -> [MovieResults] {
        let endPoint: API.Endpoints
        switch category {
        case .trending:
            endPoint = .trending
        case .topSeries:
            endPoint = .topSeries
        case .topMovies:
            endPoint = .topMovies
        case .turkishMovies:
            endPoint = .turkishMovies
        }
        
        let data = try await makeGETRequest(url: endPoint.url)
        let changesResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        return changesResponse.results
    }
    
    func fetchAllMovies() async throws -> [MovieCategory: [MovieResults]] {
        var moviesDict = [MovieCategory: [MovieResults]]()
        
        for category in MovieCategory.allCases {
            let movies = try await fetchMovies(from: category)
            moviesDict[category] = movies
        }
        
        return moviesDict
    }
    
}

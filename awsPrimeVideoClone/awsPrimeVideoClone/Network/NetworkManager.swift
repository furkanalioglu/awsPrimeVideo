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

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.themoviedb.org/3"
    private let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOGRhNDM1NGIzODA4NTc3N2Y3OWMxMjAzYjFkMDRlMiIsInN1YiI6IjY0OGFmNGVhNDJiZjAxMDBhZTJmY2RjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cjZE8TIsTdmixZ_-obV3W4yGxpdXIgR-fK8kGgEHf9A"
    
    private init() {}
    
    private func makeGETRequest(url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print(String(data: data, encoding: .utf8) ?? "Invalid data")

        
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            let apiError = try JSONDecoder().decode(APIError.self, from: data)
            throw apiError
        }
        
        return data
    }
    
    func fetchMovieList() async throws -> [MovieResults] {
        let movieChangesURL = URL(string: "\(baseURL)/movie/changes?page=1")!
        let data = try await makeGETRequest(url: movieChangesURL)
        let changesResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        print(changesResponse.results.count)
        return changesResponse.results
    }
}


struct MovieResponse: Codable {
    let results : [MovieResults]
    let page : Int?
    let total_pages : Int?
    let total_results : Int?
}

struct MovieResults : Codable {
    let id: Int?
    let adult: Bool?
}

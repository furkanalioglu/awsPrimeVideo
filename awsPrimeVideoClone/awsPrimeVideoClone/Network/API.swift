//
//  API.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import Foundation

enum API {
    static let baseURL = URL(string: "https://api.themoviedb.org/3")!
    
    static let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOGRhNDM1NGIzODA4NTc3N2Y3OWMxMjAzYjFkMDRlMiIsInN1YiI6IjY0OGFmNGVhNDJiZjAxMDBhZTJmY2RjZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cjZE8TIsTdmixZ_-obV3W4yGxpdXIgR-fK8kGgEHf9A"

    static var headers: [String: String] {
        return [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
    }
}

extension NetworkManager {
    public
    func makeGETRequest(url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = API.headers
        print("REQ is \(request)")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw try JSONDecoder().decode(APIError.self, from: data)
        }
        return data
    }
}

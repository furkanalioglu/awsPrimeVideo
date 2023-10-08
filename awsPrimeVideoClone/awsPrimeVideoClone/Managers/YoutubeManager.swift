//
//  YoutubeManager.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 8.10.2023.
//

import Foundation
import UIKit
import WebKit

struct YouTubeError: Error, Decodable {
    let error: YouTubeErrorResponse
}

struct YouTubeErrorResponse: Decodable {
    let message: String
    let code: Int
}

final
class YoutubeManager{
    static let shared = YoutubeManager()
    private init() {}
    
    func fetchTrailer(for movieTitle: String) async throws -> VideoElement? {
        let endpoint = API.Endpoints.getMovieTrailer(query: "\(movieTitle) Trailer")
        
        let data = try await NetworkManager.shared.makeGETRequest(url: endpoint.url)
        
        if let youtubeError = try? JSONDecoder().decode(YouTubeError.self, from: data) {
            throw youtubeError
        }
        
        let trailerResponse = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
        print(trailerResponse)
        return trailerResponse.items?.first
    }
    
    func presentVideo(on viewController: UIViewController, videoId: String) {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: viewController.view.bounds, configuration: webConfiguration)
        
        let url = URL(string: "https://www.youtube.com/watch?v=\(videoId)")!
        let request = URLRequest(url: url)
        webView.load(request)
        
        viewController.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor)
        ])
    }
}

struct YoutubeSearchResponse : Codable {
    let items : [VideoElement]?
}

struct VideoElement : Codable {
    let id : IdVideoElement?
}

struct IdVideoElement : Codable {
    let kindId: String?
    let videoId: String?
}

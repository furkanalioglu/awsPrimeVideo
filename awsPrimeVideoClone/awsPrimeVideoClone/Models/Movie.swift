//
//  Movie.swift
//  awsPrimeVideoClone
//
//  Created by Furkan Alioglu on 7.10.2023.
//

import Foundation

enum MovieCategory : String, CaseIterable{
    case trending
    case topMovies
    case topSeries
    case turkishMovies
    
    var title : String {
        switch self {
        case .trending:
            return "Trending TV and Movies"
        case .topMovies:
            return "Top Movies"
        case .topSeries:
            return "Top Series"
        case .turkishMovies:
            return "Turkhis Movies"
            
        }
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
    let title : String?
    let posterPath: String?
    let overview: String?
    let voteAverage: Double?
    let voteCount: Int?
    let releaseDate: String?
    let backdropPath: String?
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }
}

protocol PresenterView: AnyObject {
}

class Presenter {
    
    weak var view : PresenterView?
    
}



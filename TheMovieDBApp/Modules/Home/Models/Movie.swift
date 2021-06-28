//
//  Movie.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/12/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var identifier: Int
    var title: String?
    var overview: String?
    var video: Bool
    var adult: Bool
    var popularity: Double?
    var backdropPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]
    var voteAverage: Float?
    var voteCount: Int?
    var posterPath: String?
    var releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case overview
        case video
        case adult
        case popularity
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

extension Movie {
    var imageURL: String {
        return "\(Constants.IMAGE_URL)\(self.posterPath ?? "")"
    }
}

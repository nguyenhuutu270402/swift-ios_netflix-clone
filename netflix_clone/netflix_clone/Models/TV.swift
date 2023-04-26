//
//  Movie.swift
//  netflix_clone
//
//  Created by Thien on 26/04/2023.
//

import Foundation
struct TrendingTVsResponese: Codable {
    let results: [TV]
}

struct TV: Codable {
    let id: Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?
}

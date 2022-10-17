//
//  MovieList.swift
//  MovieDB_MVVM
//
//  Created by Esther on 10/17/22.
//

import Foundation
struct MovieList: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    private enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
    }
    let title: String
    let overview: String
    let posterPath: String
}

//
//  MovieHomePageEndpoint.swift
//  MovieDB_MVVM
//
//  Created by Esther on 10/17/22.
//

import Foundation
enum MovieHomePageEndpoint {
    
    /// enum cannot contain stored properties, so adding base url must be static
    static let baseURL = URL(string: "https://api.themoviedb.org/3/movie")
    
    case nowPlaying
    case popular
    case topRated
    case upcoming
    
    // Declare computed propery
    var fullURL: URL? {
        /// Unwrap baseURL as variable so that you can mutate it
        guard var url = Self.baseURL else {
            return nil
        }
        /// switch on self, self being the case of the enum, and append the correct path component to the url
        switch self {
        case .nowPlaying: url.appendPathComponent("now_playing")
        case .popular: url.appendPathComponent("popular")
        case .topRated: url.appendPathComponent("top_rated")
        case .upcoming: url.appendPathComponent("upcoming")
            
        }
        /// Unwrap urlComponents so you can add the api key query item
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
        }
        urlComponents.queryItems = [URLQueryItem(name: "api_key", value: "ce86ac89cb8afdc2f2e87ab1e74092d3")]
        /// Return the final URL
        return urlComponents.url
        
    }
}

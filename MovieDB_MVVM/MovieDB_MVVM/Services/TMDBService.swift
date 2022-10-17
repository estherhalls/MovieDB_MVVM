//
//  TMDBService.swift
//  MovieDB_MVVM
//
//  Created by Esther on 10/17/22.
//

import Foundation
struct TMDBService {
    
    let networkService = APIService()
    
     let baseURLString = "https://api.themoviedb.org/3/movie"
    
    // URL Components:
     let kNowPlayingComponent = "now_playing"
     let kPopularComponent = "popular"
     let kTopRatedComponent = "top_rated"
     let kUpcomingComponent = "upcoming"
    
    // URL Query Item Keys
      let kAPIKeyKey = "api_key"
      let kAPIKeyValue = "ce86ac89cb8afdc2f2e87ab1e74092d3"
    
    // These functions can be combined into one.. look into it later.
    
     func getNowPlaying(completion: @escaping (Result<MovieList, ResultError>) -> Void) {
         /// Not needed because of MovieHomePageEndPoint
//        guard let url = URL(string: baseURLString),
//              var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
//            completion(.failure(.badURL))
//            return
//        }
//        let apiQueryItem = URLQueryItem(name: kAPIKeyKey, value: kAPIKeyValue)
//        components.path += kNowPlayingComponent
//        components.queryItems = [apiQueryItem]
         guard let url = MovieHomePageEndpoint.nowPlaying.fullURL else {
             completion(.failure(.badURL))
             return
         }
        let request = URLRequest(url: url)
        networkService.perform(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
    
     func getPopular(completion: @escaping (Result<MovieList, ResultError>) -> Void) {
 
         guard let url = MovieHomePageEndpoint.popular.fullURL else {
             completion(.failure(.badURL))
             return
         }
        let request = URLRequest(url: url)
        networkService.perform(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
    
     func getTopRated(completion: @escaping (Result<MovieList, ResultError>) -> Void) {
         
         guard let url = MovieHomePageEndpoint.topRated.fullURL else {
             completion(.failure(.badURL))
             return
         }
        let request = URLRequest(url: url)
        networkService.perform(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
    
     func getUpcoming(completion: @escaping (Result<MovieList, ResultError>) -> Void) {
         
         guard let url = MovieHomePageEndpoint.upcoming.fullURL else {
             completion(.failure(.badURL))
             return
         }
        let request = URLRequest(url: url)
        networkService.perform(request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
    
} // End of Struct

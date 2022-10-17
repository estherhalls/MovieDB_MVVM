//
//  APIService.swift
//  MovieDB_MVVM
//
//  Created by Esther on 10/17/22.
//

import Foundation
struct APIService {

     func perform(request: URLRequest, completion: @escaping (Result<MovieList, ResultError>) -> Void) {
        // Data TAsk
        URLSession.shared.dataTask(with: request) { dTaskData, _, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            // Check for Data
            guard let data = dTaskData else {
                completion(.failure(.noData))
                return
            }
            do {
                guard let movieList = try? JSONDecoder().decode(MovieList.self, from: data) else {
                    completion(.failure(.couldNotUnwrap))
                    return
                }
                completion(.success(movieList))
            }
            completion(.failure(.errorDecoding))
            
        } .resume()
    }
    
} // End of Struct

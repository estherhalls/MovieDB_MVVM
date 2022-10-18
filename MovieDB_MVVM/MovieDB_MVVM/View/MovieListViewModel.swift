//
//  MovieListViewModel.swift
//  MovieDB_MVVM
//
//  Created by Esther on 10/17/22.
//

import Foundation
protocol MovieListViewModelDelegate: AnyObject {
    func updateViews()
}

class MovieListViewModel {
    // This view model is responsible for managing data presented to the view. TMDBService file will fetch data to store in this view model to drive the views.
    
    // Source of Truth
    private let service = TMDBService()
    /// Manage multiple async methods at once using dispatch group
    private let taskGroup = DispatchGroup()
    /// Add delegate property
    private let delegate: MovieListViewModelDelegate
    var sections: [MovieList] = []
    
    init(delegate: MovieListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchData() {
        /// Enter dispatch group before each service call
        taskGroup.enter()
        /// Call all methods to get data
        service.getNowPlaying() { [weak self] result in
            switch result {
            case .success(let list):
                self?.sections.append(list)
            case .failure(let error):
                print(error.errorDescription)
            }
            /// leave dispatch group at end of each service call
            self?.taskGroup.leave()
        }
        
        taskGroup.enter()
        service.getPopular() { [weak self] result in
            switch result {
            case .success(let list):
                self?.sections.append(list)
            case .failure(let error):
                print(error.errorDescription)
            }
            self?.taskGroup.leave()
        }
        
        taskGroup.enter()
        service.getUpcoming() { [weak self] result in
            switch result {
            case .success(let list):
                self?.sections.append(list)
            case .failure(let error):
                print(error.errorDescription)
            }
            self?.taskGroup.leave()
        }
        
        taskGroup.enter()
        service.getTopRated() { [weak self] result in
            switch result {
            case .success(let list):
                self?.sections.append(list)
            case .failure(let error):
                print(error.errorDescription)
            }
            self?.taskGroup.leave()
        }
        /// Inside the fetch function add the notify method using the main queue
        taskGroup.notify(queue: .main){
            self.delegate.updateViews()
        }
    }
    
    
    
} // End of Class

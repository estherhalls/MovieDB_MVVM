//
//  MovieListViewController.swift
//  MovieDB_MVVM
//
//  Created by Esther on 10/17/22.
//

import UIKit

class MovieListViewController: UIViewController {
// View controller owns the view model.
    private var viewModel: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MovieListViewModel(delegate: self)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MovieListViewController: MovieListViewModelDelegate {
    func updateViews() {
        print(viewModel.sections)
        
    }
    
}

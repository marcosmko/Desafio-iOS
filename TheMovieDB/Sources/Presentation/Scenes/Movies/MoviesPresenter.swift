//
//  MoviesPresenter.swift
//  TheMovieDB
//
//  Created by Marcos Kobuchi on 02/07/19.
//  Copyright © 2019 Marcos Kobuchi. All rights reserved.
//

import Foundation

protocol MoviesPresenterProtocol {
    func present(response: Movies.FetchMovies.Response)
}

class MoviesPresenter: MoviesPresenterProtocol {
    
    weak var viewController: MoviesDisplayLogic?
    
    func present(response: Movies.FetchMovies.Response) {
        let blockForExecutionInMainThread: BlockOperation = BlockOperation(block: {
            var displayedMovies: [Movies.FetchMovies.ViewModel.DisplayedMovie] = []
            for movie in response.movies {
                let isFavorited = false
                guard let poster = movie.poster, let title = movie.title else { continue }
                displayedMovies.append(Movies.FetchMovies.ViewModel.DisplayedMovie(poster: poster, title: title, isFavorited: isFavorited))
            }
            self.viewController?.display(viewModel: Movies.FetchMovies.ViewModel(displayedMovies: displayedMovies))
        })
        QueueManager.shared.executeBlock(blockForExecutionInMainThread, queueType: .main)
    }
    
}

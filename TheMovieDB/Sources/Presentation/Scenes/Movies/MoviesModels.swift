//
//  MoviesModels.swift
//  TheMovieDB
//
//  Created by Marcos Kobuchi on 02/07/19.
//  Copyright © 2019 Marcos Kobuchi. All rights reserved.
//

import Foundation

enum MoviesModels {
    
    struct DisplayedMovie {
        let poster: String
        let title: String
        let isFavorited: Bool
    }
    
    enum FetchMovies {
        struct Request {
            let index: Int
        }
        struct Response {
            let movies: [Movie]
        }
        struct ViewModel {
            let displayedMovies: [DisplayedMovie]
        }
    }
    
    enum Update {
        struct Request {
        }
        struct Response {
            let movies: [Movie]
        }
        struct ViewModel {
            let displayedMovies: [DisplayedMovie]
        }
    }

}

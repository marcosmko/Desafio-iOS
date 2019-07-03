//
//  MoviesRouter.swift
//  TheMovieDB
//
//  Created by Marcos Kobuchi on 02/07/19.
//  Copyright © 2019 Marcos Kobuchi. All rights reserved.
//

import Foundation
import UIKit.UIStoryboardSegue

@objc
protocol MoviesRouting: class {
    func routeToShowDetail(segue: UIStoryboardSegue, sender: Any?)
}

protocol MoviesRouterProtocol: NSObjectProtocol {
    var dataStore: MoviesDataStore? { get }
}

class MoviesRouter: NSObject, MoviesRouterProtocol, MoviesRouting {
    
    var dataStore: MoviesDataStore?
    
    func routeToShowDetail(segue: UIStoryboardSegue, sender: Any?) {
        guard let dataStore = self.dataStore,
            let destinationVC = segue.destination as? MovieViewController,
            var destinationDS = destinationVC.router?.dataStore else {
                return
        }
        
        self.passDataToShowDetail(source: dataStore, destination: &destinationDS, sender: sender)
    }
    
    // MARK: Passing data
    
    private func passDataToShowDetail(source: MoviesDataStore, destination: inout MovieDataStore, sender: Any?) {
        guard let item: Int = sender as? Int else { return }
        destination.movie = source.movies[item]
    }

}

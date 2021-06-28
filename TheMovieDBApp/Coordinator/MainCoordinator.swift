//
//  MainCoordinator.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/14/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = HomeViewController.instantiate(withStoryboard: "Home")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func showMoviewDetail(movie: Movie) {
        let vc = MovieDetailsViewController.instantiate(withStoryboard: "MovieDetails")
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        vc.viewModel.movie = movie
        navigationController.pushViewController(vc, animated: true)
    }
}

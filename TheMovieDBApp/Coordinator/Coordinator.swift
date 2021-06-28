//
//  Coordinator.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/14/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

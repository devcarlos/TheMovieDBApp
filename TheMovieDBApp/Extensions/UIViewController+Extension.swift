//
//  UIViewController+Extension.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/12/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import UIKit

extension UIViewController {
    static func controllerFromOwnStoryboard<T: UIViewController>(withName storyboardName: String? = nil) -> T {
        let controllerName = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName ?? controllerName, bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: controllerName) as? T {
            return controller
        }
        else if let controller = storyboard.instantiateInitialViewController() as? T {
            return controller
        }
        fatalError("Could not find storyboard with name \(storyboardName ?? controllerName)")
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

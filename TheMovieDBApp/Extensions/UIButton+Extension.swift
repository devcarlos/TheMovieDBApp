//
//  UIButton+Extension.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/12/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func makeRounded() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.height / 2.0
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}

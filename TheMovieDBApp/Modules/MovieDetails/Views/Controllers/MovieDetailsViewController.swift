//
//  MovieDetailsViewController.swift
//  TheMovieApp
//
//  Created by Carlos Alcala on 6/12/2021.
//  Copyright © 2021 TheMovieApp. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    // MARK: - Variables
    let viewModel = MovieDetailsViewModel()

    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }

    // MARK: - Functions
    func setupUI() {
        view.backgroundColor = .black

        posterImage.setupRoundedCorners(radius: 12)
        posterImage.setupBorder(color: .darkGray)
        self.navigationController?.navigationBar.tintColor = .white
        self.title = "Movie Details"
    }

    func loadData() {
        guard let movie = viewModel.movie else {
            return
        }

        posterImage.sd_imageIndicator = SDWebImageActivityIndicator.white
        posterImage.sd_setImage(with: URL(string: movie.imageURL), placeholderImage: UIImage())
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDate
        overviewLabel.text = movie.overview
    }
}

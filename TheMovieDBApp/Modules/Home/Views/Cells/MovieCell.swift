//
//  MoviewCell.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/13/21.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func setupUI() {
        posterImage.setupRoundedCorners(radius: 10)
    }

    public func configure(with movie: Movie) {
        posterImage.sd_imageIndicator = SDWebImageActivityIndicator.white
        posterImage.sd_setImage(with: URL(string: movie.imageURL), placeholderImage: UIImage())
        titleLabel.text = movie.title
        dateLabel.text = movie.releaseDate
    }

    override func prepareForReuse() {
        posterImage.image = nil
    }
}

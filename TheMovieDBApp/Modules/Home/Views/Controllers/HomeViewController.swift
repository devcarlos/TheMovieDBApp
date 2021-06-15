//
//  HomeViewController.swift
//  TheMovieApp
//
//  Created by Carlos Alcala on 6/12/2021.
//  Copyright © 2021 TheMovieApp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Variables
    weak var coordinator: MainCoordinator?

    let viewModel = HomeViewModel()

    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }

    // MARK: - Functions
    func setupUI() {
        view.backgroundColor = .black

        collectionView.registerCell(MovieCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10

        var columns: CGFloat = 3
        var offset: CGFloat = 32 + 30
        let height: CGFloat = 220
        var width: CGFloat = (self.view.frame.width - offset) / columns
        if UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape ?? true {
            columns = 6
            offset = 200
            width = (self.view.frame.width - offset) / columns
        }

        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 20, right: 16)
        collectionView.collectionViewLayout = layout
    }

    func refreshUI() {
        self.collectionView.reloadData()
    }

    func loadData() {
        viewModel.loadNextPage(handler: { result in
            switch result {
            case .success:
                self.refreshUI()
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        })
    }

//    func showMoviewDetail(movie: Movie) {
//        let vc = MovieDetailsViewController.instantiate(withName: "MovieDetails") as MovieDetailsViewController
//        vc.modalPresentationStyle = .fullScreen
//        vc.viewModel.movie = movie
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        coordinator?.showMoviewDetail(movie: movie)
    }
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let movie = viewModel.movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}

//MARK: - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= 10.0 {
            loadData()
        }
    }
}

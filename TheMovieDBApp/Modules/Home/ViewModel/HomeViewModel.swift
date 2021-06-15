//
//  HomeViewModel.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/12/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import Foundation

enum MovieError: Error {
    case dataFailure
    case noMorePages
    case unexpected(code: Int)
}

struct Paginate {
    var limit: Int = 20
    var page: Int = 1
    var hasMorePages: Bool = true
}

class HomeViewModel: NSObject {
    var currentMovieData: MovieData?
    var movies: [Movie] = []
    var paginate = Paginate()

    var service: ServiceProtocol?

    init(service: ServiceProtocol? = MovieService()) {
        self.service = service
    }
}

extension HomeViewModel {
    func loadNextPage(handler: @escaping (Result<Void, MovieError>) -> Void) {
        guard paginate.hasMorePages == true else {
            return
        }

        var params: [String : String] = [:]
        params["page"] = "\(self.paginate.page)"
        params["language"] = "en-US"
        params["api_key"] = Constants.API_KEY

        service?.GETRequest(params) { (response: Response<MovieData>) in
            switch response {
            case .success(let data):

                self.currentMovieData = data

                if self.paginate.page < self.currentMovieData?.totalPages ?? 0 {
                    self.paginate.page += 1
                } else {
                    self.paginate.hasMorePages = false
                }

                self.movies.append(contentsOf: self.currentMovieData?.results ?? [])
                handler(.success(()))

            case .failure(let error):
                print("error.code \(String(describing: error.code))")
                print("error.message \(String(describing: error.message))")
                handler(.failure(.dataFailure))
            default:
                print("default")
            }
        }
    }
}

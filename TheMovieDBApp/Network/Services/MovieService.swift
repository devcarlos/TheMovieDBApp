//
//  MovieService.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/12/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import Foundation

protocol ServiceProtocol: AnyObject {
    func GETRequest<T: Codable>(_ parameters: [String: String], completionBlock: @escaping(Response<T>)->Void)
}

final class MovieService {
    private var serviceBase: ServiceBaseProtocol
    private var endPointName = "MoviesEndpoint"

    init(serviceBase: ServiceBaseProtocol = ServiceBase.sharedInstance()) {
        self.serviceBase = serviceBase
    }
}

private extension MovieService {
    func getEndPoint() -> String {
        guard let path = Bundle.main.url(forResource: "EndPoints", withExtension: "plist"),
              let endPoints = NSDictionary(contentsOf: path) else {
            return ""
        }
        return endPoints.value(forKey: endPointName) as? String ?? ""
    }
}

extension MovieService: ServiceProtocol {
    func GETRequest<T: Codable>(_ parameters: [String: String], completionBlock: @escaping (Response<T>) -> Void) {
        let endPoint = getEndPoint()
        self.serviceBase.GETRequest(endPoint, parameters: parameters, completionBlock: completionBlock)
    }
}

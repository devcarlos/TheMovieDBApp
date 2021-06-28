//
//  ServiceBaseProtocol.swift
//  TheMovieDBApp
//
//  Created by Carlos Alcala on 6/12/21.
//  Copyright © 2021 TheMovieDBApp. All rights reserved.
//

import Foundation

enum RequestType: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
}

enum Response<T> {
    case success(response: T)
    case failure(error: ErrorResponse)
    case jsonSerialization
}

protocol ServiceBaseProtocol: class {
    func setToken(token: String?)
    func removeToken(token: String?)
    func GETRequest<T: Codable>(_ endPoint: String, parameters: [String: String], completionBlock: @escaping(Response<T>)->())
    func POSTRequest<T: Codable>(_ endPoint: String, parameters: [String: String], completionBlock: @escaping(Response<T>)->())
}

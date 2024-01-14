//
//  APIRequest.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import Alamofire

protocol APIRequestProtocol {
    func fetchAPIData<T: Decodable>(of type: T.Type) async throws -> T
}

enum APIResponseError: Error {
    case invalidURL
    case invalidDate
}

final class APIRequest: APIRequestProtocol {
    func fetchAPIData<T: Decodable>(of type: T.Type) async throws -> T {
        let baseURL = "http://localhost:4000"
        let endpoint = "/videos"
        let fullURL = baseURL + endpoint

        let request = AF.request(fullURL, method: .get)
        let response: T = try await request.responseDecodable(of: T.self)

        return response
    }
}

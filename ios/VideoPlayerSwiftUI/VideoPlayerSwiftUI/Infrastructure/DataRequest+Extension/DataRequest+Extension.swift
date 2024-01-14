//
//  DataRequest+Extension.swift
//  VideoPlayerSwiftUI
//
//  Created by Ruyther Costa on 2024-01-14.
//

import Alamofire

extension DataRequest {
    func responseDecodable<T: Decodable>(of type: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            self.responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

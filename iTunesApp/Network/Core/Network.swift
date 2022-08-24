//
//  Network.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import Foundation

struct Network {
    
    private let session = URLSession.shared
    
    func performRequest<T: Codable>(request: URLRequest, completion: @escaping (Swift.Result<T, NetworkError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(model))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                } else if error != nil {
                    completion(.failure(.networkError))
                } else {
                    completion(.failure(.unknownError))
                }
            }
        }
        task.resume()
    }
}

enum NetworkError: Error {
    case decodingError
    case networkError
    case unknownError
}

//
//  Services.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import Foundation
import UIKit

private let network = Network()

struct ItemServices {
    func getFilteredResult(query: String, completion: @escaping (Result<BaseModel, NetworkError>) -> Void) {
        let newQuery: String = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = urlComponents.getFilteredResult(query: newQuery.lowercased()).url {
            let urlRequest = URLRequest(url: url)
            network.performRequest(request: urlRequest, completion: completion)
        } else {
            completion(.failure(.unknownError))
        }
    }
}



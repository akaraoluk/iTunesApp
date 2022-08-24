//
//  URLComponents.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import Foundation

enum urlComponents {
    
    case getFilteredResult(query: String)
    case getDetail
    
    var url: URL? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "itunes.apple.com"
        urlComponents.path = path
        urlComponents.queryItems = service()
        return urlComponents.url
    }
    
    private func service() -> [URLQueryItem]? {
        switch self {
        case .getFilteredResult(let query):
            return [URLQueryItem(name: "term", value: String(query))]
        case .getDetail:
            return nil
        }
    }
}

extension urlComponents {
    fileprivate var path: String {
        switch self {
        case .getFilteredResult(let query):
            return "/search"
        case .getDetail:
            return "nil"
        }
    }
}

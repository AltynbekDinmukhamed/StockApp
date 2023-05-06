//
//  ApiCaller.swift
//  StockApp
//
//  Created by Димаш Алтынбек on 30.04.2023.
//

import Foundation

final class ApiCaller {
    
    static let shared = ApiCaller()
    
    private struct Constants {
        static let apiKey = "ch728n9r01qhmmunvtsgch728n9r01qhmmunvtt0"
        static let sendBox = ""
        static let baseUrl = "https://finnhub.io/api/v1/"
    }
    
    private init() {
        
    }
    
    //MARK: -Public-
    
    public func search(query: String, completion: @escaping(Result<SearchResponse, Error>) -> Void) {
        guard let url = url(for: .search, queryParams: ["q":query]) else {
            return
        }
        requst(url: url, expecting: SearchResponse.self, completion: completion)
        
    }
    
    //MARK: -Pivate-
    private enum Endpoint: String {
        case search = "search"
    }
    
    private enum APIError: Error {
        case invalidURL
        case noDataReturn
    }
    
    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        //
        var urlString = Constants.baseUrl + endpoint.rawValue
        
        //add anu param
        var queryItems = [URLQueryItem]()
        //any token
        for (name, value) in queryParams {
            queryItems.append(.init(name: name, value: value))
        }
        
        queryItems.append(.init(name: "token", value: Constants.apiKey))
        //Convert query items to suffix string
        urlString += "?" + queryItems.map{ "\($0.name)=\($0.value ?? "")"}.joined(separator: "&")
        print(urlString)
        return URL(string: urlString)
    }
    
    private func requst<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = url else {
            //Invalid error
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturn))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}

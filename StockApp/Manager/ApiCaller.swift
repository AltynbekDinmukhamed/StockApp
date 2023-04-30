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
        static let apiKey = ""
        static let sendBox = ""
        static let baseUrl = ""
    }
    
    private init() {
        
    }
    
    //MARK: -Public-
    
    //get stock
    
    //search stock
    
    //MARK: -Pivate-
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case invalidURL
        case noDataReturn
    }
    
    private func url(for endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        //
        
        return nil
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

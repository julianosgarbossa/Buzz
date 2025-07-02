//
//  URLSessionNetworking.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
}

protocol NetworkingService {
    func request<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

class URLSessionNetworking: NetworkingService {
    func request<T>(url: URL, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
                return
            }
        }
        task.resume()
    }
}

//
//  NetworkManager.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//


import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    private let session: URLSession
    private init(_ session: URLSession = .shared) {
        self.session = session
    }
    func performNetworRequest<T: Decodable>(_ apiComponent: APIComponent, completion: @escaping ResponseHandler<T>) {
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(APIError(type: .noConnetion, message: "no connecttion")))
            return
        }
        requestDataTask(url: apiComponent.buildRequest(), completion: completion)
    }
    func performNetworRequest<T: Decodable>(urlStr: String, completion: @escaping ResponseHandler<T>) {
        guard let url = URL(string: urlStr) else {
            return
        }
        requestDataTask(url: URLRequest(url: url), completion: completion)
    }
    func performNetworRequest<T: Decodable>(urlRequest: URLRequest, completion: @escaping ResponseHandler<T>) {
        requestDataTask(url: urlRequest, completion: completion)
    }
    private func requestDataTask<T: Decodable> (url: URLRequest, completion: @escaping ResponseHandler<T>) {
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(APIError(type: .api, message: "api error")))
                return
            }
            guard let data = data
            else {
                completion(.failure(APIError(type: .api, message: "api error")))
                return
            }
            do {                
                let decoder = JSONDecoder()
                let model = try decoder.decode(T.self, from: data)
                completion(.success(model))
            }catch {
                completion(.failure(APIError(type: .parsing, message: "parsing error")))
            }
        }.resume()
    }
}

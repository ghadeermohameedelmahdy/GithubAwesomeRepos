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
                completion(.failure(APIError.noConnetion))
            return
        }
        session.dataTask(with: buildRequest(apiComponent)) { (data, response, error) in
            guard error == nil else {
                completion(.failure(APIError.api(description: error?.localizedDescription ?? "request error found")))
                return
            }
            guard let data = data
                else {
                    completion(.failure(APIError.api(description: error?.localizedDescription ?? "no data found")))
                    return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(APIError.api(description: error?.localizedDescription)))
                return
            }
            do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(T.self, from: data)
                    completion(.success(model))
            }catch let jsonError {
                completion(.failure(APIError.parsing(description: jsonError.localizedDescription)))
            }
        }.resume()
    }
    private func buildRequest(_ apiComponent: APIComponent) -> URLRequest {
        var component: URLComponents = URLComponents()
        component.host = apiComponent.baseUrl
        component.scheme = apiComponent.scheme
        component.path = apiComponent.path
        if let parameter = apiComponent.parameter {
            parameter.forEach {
                if component.queryItems == nil {
                    component.queryItems = []
                }
                component.queryItems?.append(URLQueryItem(name: $0.key, value: $0.value))
            }
        }
        var urlRequest = URLRequest(url: component.url!)
        urlRequest.httpMethod = apiComponent.method.rawValue
        configureHeaders(headers: apiComponent.headers, request: &urlRequest)
        return urlRequest
    }
    private func configureHeaders(headers: [String: String]?, request: inout URLRequest) {
        headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
    }
}

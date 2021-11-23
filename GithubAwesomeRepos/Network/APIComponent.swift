//
//  APIRouter.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation
/**
 APIComponents is an abstraction layer , every api components must conform to it
 */
typealias HttpHeaders = [String: String]
typealias HttpParameters = [String: String]
typealias ResponseHandler<T: Decodable> = (Result<T, APIError>) -> Void
protocol APIComponent {
    var path: String {get}
    var baseUrl: String {get}
    var scheme: String {get}
    var method: HttpMethod { get }
    var headers: HttpHeaders? { get }
    var parameter: HttpParameters? { get}
}
enum HttpMethod: String {
    case get = "Get"
    case post = "Post"
}
extension APIComponent {
    var headers: HttpHeaders? {
        return ["content-type": "application/json",
                "Accept": "application/vnd.github.v3+json"]
    }
    var baseUrl: String {
        return APIEnviromentManager.shared.baseURL
    }
    var scheme: String {
        return "https"
    }
}

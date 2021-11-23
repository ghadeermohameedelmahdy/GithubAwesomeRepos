//
//  APIError.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation

struct APIError: Error, Codable {
    init(type: APIError.APIErrorType = .general, message: String? = nil) {
        self.type = type
        self.message = message
    }
    
    enum APIErrorType: String {
        case parsing
        case api
        case noConnetion
        case exceedLimit
        case general
    }
    var type: APIErrorType = .general
    var message: String?
    enum CodingKeys: String, CodingKey {
        case message
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try? values.decode(String.self, forKey: .message)
    }
    func buildErrorMessage() -> String {
        return "\(type.rawValue): \(message ?? "")"
    }
}


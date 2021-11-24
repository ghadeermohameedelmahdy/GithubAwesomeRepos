//
//  GithubRepoDetailsUsecase.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import UIKit

class GithubRepoDetailsUsecase: GithubRepoDetailsUsecaseProtocol {
    static let shared = GithubRepoDetailsUsecase()
    private init() {}
    func fetchRepoDetails (repoURL: String, completion: @escaping ResponseHandler<GithubRepoModel?>) {
        NetworkManager.shared.performNetworRequest(urlStr: repoURL) { result in
            completion(result)
        }
    }
}

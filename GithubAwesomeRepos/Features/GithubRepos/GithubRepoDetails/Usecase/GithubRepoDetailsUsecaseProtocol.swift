//
//  GithubRepoDetailsUsecaseProtocol.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
protocol GithubRepoDetailsUsecaseProtocol {
    func fetchRepoDetails (repoURL: String, completion: @escaping ResponseHandler<GithubRepoModel?>)
}


//
//  GithubReposUsecaseProtocol.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation
/**
 usecase protocol to make an abstraction layer to help with unit test
 */
protocol GithubReposUsecaseProtocol {
    func fetchReposList (page: Int, completion: @escaping ResponseHandler<[GithubRepoModel]?>)
}

//
//  GithubReposUsecase.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation
import UIKit
/**
 Usecase is used to handle data source , so if you want to fetch it from local repo or remote api according to condition
 */
class GithubReposUsecase: GithubReposUsecaseProtocol {
    static let shared = GithubReposUsecase()
    private init() {}
    func fetchReposList(page: Int, completion: @escaping ResponseHandler<[GithubRepoModel]?>) {
        let apiComponent = GithubReposAPIComponents( requestType: .reposList, parameter: ["q":"tetris+language:assembly","page":"\(page)", "per_page":"1"])
        networkCallForReposList(from: apiComponent.buildRequest(), completion: completion)
    }
    func networkCallForReposList (from urlRequest: URLRequest, completion: @escaping ResponseHandler<[GithubRepoModel]?>) {
        NetworkManager.shared.performNetworRequest(urlRequest: urlRequest, completion: completion)
    }
}

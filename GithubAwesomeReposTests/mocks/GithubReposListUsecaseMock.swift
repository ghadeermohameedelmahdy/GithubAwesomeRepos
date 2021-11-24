//
//  GithubReposListUsecaseMock.swift
//  GithubAwesomeReposTests
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
@testable import GithubAwesomeRepos
/**
 The mock APIService(GithubReposListUsecaseMock) object doesn’t connect to the real server,
 it’s an object designed only for the test.
  so that we are able to inject different dependency in different situation.
 */
class GithubReposListUsecaseMock: GithubReposUsecaseProtocol {
    var fetchReposListIsCalled = false

    var repos: [GithubRepoModel] = []
    var completeClosure: (ResponseHandler<[GithubRepoModel]?>)!

    func fetchReposList(page: Int, completion: @escaping ResponseHandler<[GithubRepoModel]?>) {
        fetchReposListIsCalled = true
        completeClosure = completion
    }
    func fetchSuccess() {
        completeClosure(.success(repos))
    }

    func fetchFail(error: APIError?) {
        completeClosure(.failure(error ?? APIError(type: .general, message: "something went wrong")))
    }
}

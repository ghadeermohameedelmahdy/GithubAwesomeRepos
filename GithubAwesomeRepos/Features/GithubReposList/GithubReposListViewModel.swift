//
//  ReposListViewModel.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
class GithubReposListViewModel {
    let usecase: GithubReposUsecaseProtocol
    init(usecase: GithubReposUsecaseProtocol = GithubReposUsecase.shared) {
        self.usecase = usecase
    }
}

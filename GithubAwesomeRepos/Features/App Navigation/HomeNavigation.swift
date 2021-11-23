//
//  HomeNavigation.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import XCoordinator
// make route has tab controller or navigation controller or a new root view controller
enum HomeNavigationRoute: Route {
    case githubReposList
    case githubRepoDetails(model: GithubRepoModel)
}

class HomeNavigationCoordinator: NavigationCoordinator<HomeNavigationRoute> {
    init() {
        super.init(initialRoute: .githubReposList)

    }
    override func prepareTransition(for route: HomeNavigationRoute) -> NavigationTransition {
        switch route {
        case .githubReposList:
            let homeVC = GithubReposListViewController.instaintiate(on: .githubRepos)
            homeVC.dataViewModel = GithubReposListViewModel()
            return .push(homeVC)
        case .githubRepoDetails(let model):
            let detailsVC = GithubRepoDetailsViewController.instaintiate(on: .githubRepos)
           // homeVC.dataViewModel = GithubReposListViewModel()
            detailsVC.modalPresentationStyle = .fullScreen
            return .push(detailsVC)
        }
    }
}

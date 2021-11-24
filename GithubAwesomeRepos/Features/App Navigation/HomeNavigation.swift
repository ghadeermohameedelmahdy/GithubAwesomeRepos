//
//  HomeNavigation.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import XCoordinator
import SafariServices
// make route has tab controller or navigation controller or a new root view controller
enum HomeNavigationRoute: Route {
    case githubReposList
    case githubRepoDetails(model: GithubRepoModel)
    case openURL(urlStr: String)
}

class HomeNavigationCoordinator: NavigationCoordinator<HomeNavigationRoute> {
    init() {
        super.init(initialRoute: .githubReposList)
        self.viewController.navigationController?.navigationBar.tintColor = DesignSystem.shared.choosedColorPalette.actionColor

    }
    override func prepareTransition(for route: HomeNavigationRoute) -> NavigationTransition {
        switch route {
        case .githubReposList:
            let homeVC = GithubReposListViewController.instaintiate(on: .githubRepos)
            homeVC.dataViewModel = GithubReposListViewModel()
            homeVC.router = self.unownedRouter
            return .push(homeVC)
        case .githubRepoDetails(let model):
            let detailsVC = GithubRepoDetailsTableViewController.instaintiate(on: .githubRepos)
            detailsVC.viewModel = GithubRepoDetailsViewModel(repoModel: model)
            detailsVC.router = self.unownedRouter
            return .push(detailsVC)
        case .openURL(let url):
            guard let url = URL(string: url) else { return .none()}
            UIApplication.shared.open(url)
            return .none()
        }
    }
}

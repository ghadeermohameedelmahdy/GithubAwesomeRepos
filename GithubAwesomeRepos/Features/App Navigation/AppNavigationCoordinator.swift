//
//  NavigationController.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
import UIKit
import XCoordinator

enum AppRoute: Route {
    case splash
    case home
    
}

class AppNavigationCoordinator: NavigationCoordinator<AppRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .splash)
    }

    // MARK: Overrides

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .splash:
            let splashVC = CustomSplashScreenViewController.instaintiate(on: .main)
            splashVC.router = strongRouter
            splashVC.modalPresentationStyle = .fullScreen
            return .push(splashVC)
        case .home:
           let homeCoordinator = HomeNavigationCoordinator()
            return .presentFullScreen(homeCoordinator)
        }
    }
}


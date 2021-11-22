//
//  NavigationController.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
import UIKit
class NavigationController {
    static let shared = NavigationController()
    private init (){}
    func presentHome (from parentVC: UIViewController) {
        let homeVC = GithubReposListViewController.instaintiate(on: .githubRepos)
        homeVC.modalPresentationStyle = .fullScreen
        parentVC.present(homeVC, animated: true, completion: nil)
    }
}

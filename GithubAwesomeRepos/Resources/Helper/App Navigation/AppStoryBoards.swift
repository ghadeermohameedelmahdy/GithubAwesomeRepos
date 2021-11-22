//
//  StoryBoardExt.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
/**
 to create any viewcontoller with accessing storyboard  easily
 */
import UIKit
protocol Storyboarded {
    static func instaintiate(on storyboard: AppStoryboards) -> Self
}
enum AppStoryboards: String {
    case main = "Main"
    case githubRepos = "GithubReposStoryBoard"
}
extension Storyboarded where Self: UIViewController {
    static func instaintiate(on storyboard: AppStoryboards) -> Self {
        let vcID = String(describing: self)
        let storyBoard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return storyBoard.instantiateViewController(identifier: vcID) as! Self
    }
}
extension UIViewController: Storyboarded {} // to make all our view controllers conforms to this protocol

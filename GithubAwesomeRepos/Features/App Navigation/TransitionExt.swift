//
//  TransitionExt.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import XCoordinator

extension Transition {

    static func presentFullScreen(_ presentable: Presentable, animation: Animation? = nil) -> Transition {
        presentable.viewController?.modalPresentationStyle = .fullScreen
        return .present(presentable, animation: animation)
    }
}

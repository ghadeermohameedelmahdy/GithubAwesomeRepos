//
//  GithubReposAPIComponent.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation

struct GithubReposAPIComponents: APIComponent {
    enum GithubReposEndPoint {
    case reposList
    }
    var requestType: GithubReposEndPoint
    
    var path: String {
        switch requestType {
        case .reposList:
            return "/repositories"
        }
    }
    var method: HttpMethod = .get
    var parameter: HttpParameters? = nil
}

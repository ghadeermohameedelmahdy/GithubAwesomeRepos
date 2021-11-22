//
//  GithubReposAPIComponent.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation

struct GithubReposAPIComponents: APIComponent {
   
    var path: String = "/repositories"
    var method: HttpMethod = .get
    var parameter: HttpParameters? = nil
}

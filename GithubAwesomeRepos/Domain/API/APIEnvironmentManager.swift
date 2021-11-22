//
//  APIEnvironmentManager.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation
/**
 APIEnviromentManager is a singleton design pattern to create only one object through the user session and
 share the same resources from one place.
 */
class APIEnviromentManager {
    static var shared = APIEnviromentManager()
    var baseURL: String {
        return "api.github.com"
    }
}

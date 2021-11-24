//
//  reposStubGenerator.swift
//  GithubAwesomeReposTests
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
@testable import GithubAwesomeRepos

class StubGenerator {
    func stubGithubReposList() -> [GithubRepoModel]? {
        guard let path = Bundle(for: GithubReposListUsecaseTest.self).path(forResource: "reposStub", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                return nil
        }

        let decoder = JSONDecoder()
        let reposList = try? decoder.decode([GithubRepoModel].self, from: data)
        return reposList
    }
}

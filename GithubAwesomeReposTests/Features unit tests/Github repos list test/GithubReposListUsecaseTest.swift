//
//  GithubReposListUsecaseTest.swift
//  GithubAwesomeReposTests
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import XCTest

@testable import GithubAwesomeRepos
class GithubReposListUsecaseTest: XCTestCase {
    // sut for system under test, we make it as TestCase
        var sut: GithubReposUsecase!

        override func setUp() {
            super.setUp()
            sut = GithubReposUsecase.shared
        }

        override func tearDown() {
            sut = nil
            super.tearDown()
        }

        func test_fetch_github_repos_success() {
            // Given : what we have or expect to see
            let promise = XCTestExpectation(description: "Fetch repos completed")
            var responseError: APIError?
            var responseRepos: [GithubRepoModel]?

            // When : what is the action to do
            guard let bundle = Bundle(for: GithubReposListUsecaseTest.self).path(forResource: "reposStub", ofType: "json") else {
                XCTFail("Error: content not found")
                return
            }
            print(bundle)

            sut.networkCallForReposList(from: URLRequest(url: URL(fileURLWithPath: bundle)), completion: { res in
                switch res {
                case .success(let model):
                    responseRepos = model
                case .failure(let error):
                    responseError = error
                }
                promise.fulfill()
            })
            // fack asyncorouns task time with adding 1 sec
            wait(for: [promise], timeout: 1)

            // Then : what is the result
            XCTAssertNil(responseError)
            XCTAssertNotNil(responseRepos)
        }
    // TODO: add test for error response
    func test_fetch_github_repos_error() {
    }
    }

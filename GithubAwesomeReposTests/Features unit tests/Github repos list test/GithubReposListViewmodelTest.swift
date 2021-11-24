//
//  GithubReposListViewmodelTest.swift
//  GithubAwesomeReposTests
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import XCTest
@testable import GithubAwesomeRepos

class GithubReposListViewmodelTest: XCTestCase {
    var sut: GithubReposListViewModel!
    var usecaseMock: GithubReposListUsecaseMock!

    override func setUp() {
        super.setUp()
        usecaseMock = GithubReposListUsecaseMock()
        sut = GithubReposListViewModel(usecase: usecaseMock)
    }
    
    override func tearDown() {
        sut = nil
        usecaseMock = nil
        super.tearDown()
    }
    // here we make sure that api network is called successfully
    func test_fetch_first_repos_list() {
        // When
        sut.fetchFirstPage()
    
        // Then
        XCTAssert(usecaseMock.fetchReposListIsCalled)
    }
    
    func test_fetch_repos_fail() {
        // Given
        let error = APIError(type: .api, message: "api fail")

        // When
        sut.fetchFirstPage()
        usecaseMock.fetchFail(error: error)

        // Then
        XCTAssertNotNil(sut.alertMessage)
    }

    func test_create_cell_view_model() {
        // Given
        guard let repos = StubGenerator().stubGithubReposList() else {
            XCTFail("Failed to generate repos list")
            return
        }

        usecaseMock.repos = repos

        let promise = XCTestExpectation(description: "reload closure triggered")
        sut.reloadTableView = { () in // to make sure that after fetching data we reload table view
            promise.fulfill()
        }

        // When
        sut.fetchFirstPage()
        usecaseMock.fetchSuccess()
        wait(for: [promise], timeout: 1.0)

        // Number of cell view model is equal to the number of photos
        XCTAssertEqual(sut.numberOfCells, repos.count)
    }

    func test_error_state_when_fetching() {
    }

    func testGetCellViewModel() {
        //Given a sut with fetched repos already
        // Given
        guard let repos = StubGenerator().stubGithubReposList() else {
            XCTFail("Failed to generate repos list")
            return
        }

        usecaseMock.repos = repos

        sut.fetchFirstPage()
        usecaseMock.fetchSuccess()

        let indexPath = IndexPath(row: 0, section: 0)
        let testRepoModel = usecaseMock.repos[indexPath.section]

        // When
        let vm = sut.getCellViewModel(at: indexPath)

        //Assert
        XCTAssertEqual(vm.repoModel.name, testRepoModel.name)
    }

    func testCreateCellViewModel() {
    }
}

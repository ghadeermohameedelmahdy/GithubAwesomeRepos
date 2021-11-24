//
//  ReposListViewModel.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
class GithubReposListViewModel {
    // MARK: - init
    let usecase: GithubReposUsecaseProtocol
    /**
     here using dependency injection concept to make it easily for unit testing, more abstracted to reuse this viewModel if needed.
     */
    init(usecase: GithubReposUsecaseProtocol = GithubReposUsecase.shared) {
        self.usecase = usecase
    }
    private var data: [GithubRepoModel] = []
    // MARK: -  callback for interfaces
    var reloadTableView: (()->())?
    var showError: (()->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    
    var alertMessage: String? {
        didSet {
            self.showError?()
        }
    }
    private(set) var cellViewModels: [DataListCellViewModel] = [DataListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    // MARK: - Network Calls
    func fetchFirstPage(){
        showLoading?()
        fetchReposPage(page: 0)
    }
    private func fetchReposPage (page: Int) {
        usecase.fetchReposList(page: page) { [weak self] result in
            guard let self = self else {return}
                switch result {
                case .success(let repos):
                    let cellDataSource = repos?.compactMap({DataListCellViewModel(repoModel: $0)}) ?? []
                    self.data.append(contentsOf: repos ?? [])
                    self.cellViewModels.append(contentsOf: cellDataSource)
                    self.reloadTableView?()
                case .failure(let error):
                    self.alertMessage = error.buildErrorMessage()
                }
            
        }
    }
   
    
    // MARK: - UI Setup
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> DataListCellViewModel {
        return cellViewModels[indexPath.section]
    }
    // MARK: Searchbar
    func searchRepositoryName(_ word: String? = nil) {
        if let word = word, !word.isEmpty {
           let filterdModels = data.filter { repoModel in
                repoModel.fullName?.contains(word) ?? false
            }
            self.cellViewModels = filterdModels.compactMap({DataListCellViewModel(repoModel: $0)})
        }else {
            self.cellViewModels = data.compactMap({DataListCellViewModel(repoModel: $0)})
        }
    }
}

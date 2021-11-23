//
//  ReposListViewModel.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
class GithubReposListViewModel {
    // MARK:- init
    let usecase: GithubReposUsecaseProtocol
    /**
     here using dependency injection concept to make it easily for unit testing, more abstracted to reuse this viewModel if needed.
     */
    init(usecase: GithubReposUsecaseProtocol = GithubReposUsecase.shared) {
        self.usecase = usecase
    }
    var data: [GithubRepoModel] = []
    // MARK:- UI Callback
    var reloadTableView: (()->())?
    var showError: ((String?)->())?
    var showLoading: (()->())?
    var hideLoading: (()->())?
    
    private var cellViewModels: [DataListCellViewModel] = [DataListCellViewModel]() {
        didSet {
            self.reloadTableView?()
        }
    }
    // MARK:- Network Calls
    func fetchFirstPage(){
        showLoading?()
        fetchReposPage(page: 0)
    }
    private func fetchReposPage (page: Int) {
        usecase.fetchReposList(page: page) { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.hideLoading?()
                switch result {
                case .success(let repos):
                    let cellDataSource = DataListCellViewModel.createCellDataSource(with: repos ?? [])
                    self.data.append(contentsOf: repos ?? [])
                    self.cellViewModels.append(contentsOf: cellDataSource)
                    self.reloadTableView?()
                case .failure(let error):
                    self.showError?(error.buildErrorMessage())
                }
            }
            
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> DataListCellViewModel {
        return cellViewModels[indexPath.row]
    }
}

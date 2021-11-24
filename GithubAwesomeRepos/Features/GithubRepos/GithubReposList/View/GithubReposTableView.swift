//
//  GithubReposTableView.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
import  UIKit
extension  GithubReposListViewController: UITableViewDataSource, UITableViewDelegate {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GithubRepoItemTableViewCell.nib, forCellReuseIdentifier: GithubRepoItemTableViewCell.identifier)
    }
    // MARK:- Tableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataViewModel?.numberOfCells ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GithubRepoItemTableViewCell.identifier, for: indexPath) as? GithubRepoItemTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        let cellViewModel = dataViewModel?.getCellViewModel( at: indexPath )
        cellViewModel?.createCellDataSource()
        cell.cellViewModel = cellViewModel
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = dataViewModel?.getCellViewModel( at: indexPath )
        guard let model = cellViewModel?.repoModel else{return}
        self.router?.trigger(.githubRepoDetails(model: model))
    }
    // MARK:- Tableview delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

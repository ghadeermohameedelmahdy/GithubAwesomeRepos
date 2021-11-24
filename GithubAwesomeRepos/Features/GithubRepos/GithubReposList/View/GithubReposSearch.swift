//
//  GithubReposSearch.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import UIKit
extension GithubReposListViewController: UISearchBarDelegate {
    func setupSearchbar () {
        reposSearchBar.delegate = self
        reposSearchBar.tintColor = DesignSystem.shared.choosedColorPalette.actionColor
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        startSearching(text: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dataViewModel?.searchRepositoryName()
        searchBar.resignFirstResponder()
    }
    private func startSearching (text: String) {
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        dataViewModel?.searchRepositoryName(text)
    }
}

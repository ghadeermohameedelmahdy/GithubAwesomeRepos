//
//  GithubRepoDetailsCollectionView.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import UIKit
extension GithubRepoDetailsTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func setupCollectionView () {
        repoDetailsCollectionView.delegate = self
        repoDetailsCollectionView.dataSource = self
        repoDetailsCollectionView.register(BasicDataCollectionViewCell.nib, forCellWithReuseIdentifier: BasicDataCollectionViewCell.identifier)
        repoDetailsCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        repoDetailsCollectionView.collectionViewLayout = generateLayout()
    }
    // MARK: - collection view datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.detailsSection.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicDataCollectionViewCell.identifier, for: indexPath) as! BasicDataCollectionViewCell
        if let model = viewModel?.detailsSection[indexPath.row] {
            cell.setupData(model: model)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellViewModel = viewModel?.getCellViewModel(at: indexPath)
        guard let url = cellViewModel?.urlString else{return}
        self.router?.trigger(.openURL(urlStr: url))
    }
    // MARK: - collection view layout
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let fullItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: fullItem,
            count: 2
        )
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}

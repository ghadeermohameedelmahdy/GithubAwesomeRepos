//
//  GithubRepoDetailsViewModel.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import UIKit

class GithubRepoDetailsViewModel {
    // TODO: - add usecase to check if repo details downloaded already or not, if not reload it 
    private let repoModel: GithubRepoModel
    var setupUI: ((String?, String?)->())?
    var detailsSection: [RepoDetailsSectionModel] = []
    init(repoModel: GithubRepoModel) {
        self.repoModel = repoModel
    }
    func buildData() {
        buildSectionDetails()
        setupUI?(repoModel.fullName, repoModel.owner?.avatarURL)
    }
    private func buildSectionDetails () {
        detailsSection.append(RepoDetailsSectionModel(title: "Description\n \(repoModel.githubRepoDescription ?? "")", imageName: "pencil.and.outline"))
        detailsSection.append(RepoDetailsSectionModel(title: "Subscribers\n \(repoModel.subscribersCount ?? 0)", imageName: "heart.circle.fill"))
        detailsSection.append(RepoDetailsSectionModel(title: "Visibility\n \(repoModel.visibility ?? "")", imageName:"person.3.sequence.fill"))
        detailsSection.append(RepoDetailsSectionModel(title: "Default branch\n \(repoModel.defaultBranch ?? "")", imageName: "arrow.triangle.pull"))
        detailsSection.append(RepoDetailsSectionModel(title: "Git URL", imageName: "link.circle.fill", urlString: repoModel.gitURL ?? ""))
    }
    func getCellViewModel (at indexPath: IndexPath) -> RepoDetailsSectionModel {
        return detailsSection[indexPath.row]
    }
    
}

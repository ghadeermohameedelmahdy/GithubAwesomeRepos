//
//  DataListCellViewModel.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
/**
 cell viewmodel to be used with ui
 */
class DataListCellViewModel: NSObject {
    init(repoModel: GithubRepoModel) {
        self.repoModel = repoModel
    }
    private(set) var titleText: String?
    private(set) var subTitleText: String?
    private(set) var imageURL: String?
    private(set) var detailsURL: String?
    private(set) var extraDetails: String?
    var repoModel: GithubRepoModel {
        didSet {
            createCellDataSource()
        }
    }
   func createCellDataSource() {
        titleText = "Repository Name : \(repoModel.name ?? "")"
        subTitleText = "Repository Name : \(repoModel.owner?.login ?? "")"
        imageURL = repoModel.owner?.avatarURL
        detailsURL = repoModel.url
        extraDetails = repoModel.createdAt != nil ? "Created At : \(repoModel.createdAt?.getFormattedDate() ?? "")" : nil
    }
}

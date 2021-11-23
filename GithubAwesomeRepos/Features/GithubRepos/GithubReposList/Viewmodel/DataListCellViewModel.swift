//
//  DataListCellViewModel.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
class DataListCellViewModel: NSObject {
    init(titleText: String? = nil, subTitleText: String? = nil, imageURL: String? = nil, detailsURL: String? = nil, extraDetails: String? = nil) {
        self.titleText = titleText
        self.subTitleText = subTitleText
        self.imageURL = imageURL
        self.detailsURL = detailsURL
        self.extraDetails = extraDetails
    }
    var titleText: String?
    var subTitleText: String?
    var imageURL: String?
    var detailsURL: String?
    var extraDetails: String?
    
    static func createCellDataSource(with data: [GithubRepoModel]) -> [DataListCellViewModel] {
       return data.compactMap { model in
           DataListCellViewModel(titleText: "Repository Name : \(model.name ?? "")" , subTitleText: "Repository Name : \(model.owner?.login ?? "")", imageURL: model.owner?.avatarURL,detailsURL: model.url, extraDetails: model.createdAt != nil ? "Created At : \(model.createdAt ?? "")" : nil)
        }
    }
}

//
//  BasicDataCollectionViewCell.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import UIKit

class BasicDataCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var dataImage: UIImageView!
    @IBOutlet private weak var dataLabel: UILabel!
    var cellURL: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dataImage.tintColor = DesignSystem.shared.choosedColorPalette.actionColor
    }
    func setupData (model: RepoDetailsSectionModel) {
        dataLabel.text = model.title
        if let image = model.imageName {
            dataImage.image = UIImage(systemName: image)
        }
        cellURL = model.urlString
    }

}

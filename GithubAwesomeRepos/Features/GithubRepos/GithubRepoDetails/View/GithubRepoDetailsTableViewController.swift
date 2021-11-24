//
//  GithubRepoDetailsTableViewController.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import UIKit
import XCoordinator
class GithubRepoDetailsTableViewController: ViewControllerWithSettings {

    // MARK: - IBOutlets and Variables
    
    @IBOutlet weak var repoNameLabel: UILabel!
    
    @IBOutlet weak var repoImage: UIImageView!
    
    @IBOutlet weak var repoDetailsCollectionView: UICollectionView!
    var router: UnownedRouter<HomeNavigationRoute>?
    var viewModel: GithubRepoDetailsViewModel?
    let colorPalette = DesignSystem.shared.choosedColorPalette
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = colorPalette.actionColor
        setupCollectionView()
        initViewModel()
    }
    
    // MARK: - Helper functions
    private func initViewModel () {
        viewModel?.setupUI = { [weak self] repoName, repoImage in
            self?.setupRepoName(repoName)
            self?.setupRepoImage(repoImage)
        }
        viewModel?.buildData()
    }
    private func setupRepoName (_ name: String?){
        repoNameLabel.textColor = colorPalette.actionColor
        repoNameLabel.text = name
    }
    private func setupRepoImage (_ name: String?){
        repoImage.loadImageUsingCache(withUrl: name ?? "")
    }
    // MARK: - IBActions

}


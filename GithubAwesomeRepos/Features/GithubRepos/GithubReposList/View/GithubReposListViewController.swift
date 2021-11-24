//
//  GithubReposListViewController.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import UIKit
import XCoordinator
class GithubReposListViewController: ViewControllerWithSettings {
    // MARK:- IBOutlets and Variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reposSearchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var dataViewModel: GithubReposListViewModel?
    var router: UnownedRouter<HomeNavigationRoute>?
    // MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    // MARK:- Helper functions
    private func initViewModel(){
        dataViewModel?.reloadTableView = {
            DispatchQueue.main.async {[weak self] in self?.tableView.reloadData()}
        }
        dataViewModel?.showError = { [weak self] in
            DispatchQueue.main.async {
                if let message = self?.dataViewModel?.alertMessage {
                    self?.showAlert(message)
                }
            }
        }
        dataViewModel?.showLoading = {
            DispatchQueue.main.async { [weak self] in self?.activityIndicator.startAnimating() }
        }
        dataViewModel?.hideLoading = {
            DispatchQueue.main.async { [weak self] in self?.activityIndicator.stopAnimating() }
        }
        dataViewModel?.fetchFirstPage()
    }
    private func setupUI (){
        self.title = "Github Awesome Repositories"
        self.checkForNetworkAvailibilty()
        setupSearchbar()
        setupTableView()
        activityIndicator.hidesWhenStopped = true
        hideKeyboardWhenTappedAround()
    }
    
    // MARK:- IBActions
    @IBAction func colorThemeButton(_ sender: UISwitch) {
        DesignSystem.shared.currentColorPaletteType = sender.isOn ? .colorPaletteSecond : .colorPaletteOne
    }
}

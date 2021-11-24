//
//  GithubReposListViewController.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import UIKit
import XCoordinator
class GithubReposListViewController: UIViewController {
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
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
        dataViewModel?.showError = { message in
            DispatchQueue.main.async { self.showAlert(message ?? "something went wrong") }
        }
        dataViewModel?.showLoading = {
            DispatchQueue.main.async { self.activityIndicator.startAnimating() }
        }
        dataViewModel?.hideLoading = {
            DispatchQueue.main.async { self.activityIndicator.stopAnimating() }
        }
        dataViewModel?.fetchFirstPage()
    }
    private func setupUI (){
        self.title = "Github Awesome Repositories"
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

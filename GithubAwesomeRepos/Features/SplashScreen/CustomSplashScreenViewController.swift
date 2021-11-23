//
//  CustomSplashScreenViewController.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import UIKit
import Lottie
import XCoordinator
class CustomSplashScreenViewController: UIViewController {
    @IBOutlet weak var logoLottieView: AnimationView!
    var router: StrongRouter<AppRoute>?
    // MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        logoLottieView.play {[weak self] isFinished in
            if isFinished {
                self?.router?.trigger(.home)
            }
        }
    }

}

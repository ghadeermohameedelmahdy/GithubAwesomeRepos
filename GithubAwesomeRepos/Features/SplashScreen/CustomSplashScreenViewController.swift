//
//  CustomSplashScreenViewController.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import UIKit
import Lottie
class CustomSplashScreenViewController: UIViewController {
    @IBOutlet weak var logoLottieView: AnimationView!
    // MARK:- life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        logoLottieView.play { isFinished in
            if isFinished {
                NavigationController.shared.presentHome(from: self)
            }
        }
    }

}

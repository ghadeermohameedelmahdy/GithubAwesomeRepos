//
//  ViewControllerWithSettings.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import UIKit
import Network
class ViewControllerWithSettings: UIViewController {
    private let monitor = NWPathMonitor()
    private let networkMonitorqueue = DispatchQueue(label: "Monitor")
    override func viewDidLoad() {
         setupNetworkMonitor()
         
    }
    private func setupNetworkMonitor () {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else {return}
            DispatchQueue.main.async {
                print(path.status)
                if path.status == .satisfied {
                    print("We're connected!")
                    self.hideWarningView()
                } else {
                    print("No connection.")
                    self.showWarningView(message: "No internet Connection")
                   
                }
            }
            print(path.isExpensive)
        }
        checkForNetworkAvailibilty()
    }
    func checkForNetworkAvailibilty (){
        monitor.start(queue: networkMonitorqueue)
    }
}

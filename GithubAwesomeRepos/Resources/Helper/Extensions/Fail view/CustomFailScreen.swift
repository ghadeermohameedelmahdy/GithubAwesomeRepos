//
//  FailView.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 24/11/2021.
//

import Foundation
import UIKit
class CustomFailScreen: UIView {
    @IBOutlet weak var messageLabel: UILabel!

   // var message: String? = "No internet connection"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setViewData(message: String) {
        self.messageLabel.text = message
    }
}
extension UIViewController {
    private struct Holder {
        static var myComputedProperty: CustomFailScreen?
    }
   private var customFailureView: CustomFailScreen? {
        get {
            return Holder.myComputedProperty
        }
        set(newValue) {
            Holder.myComputedProperty = newValue
        }
    }
    func showWarningView(message: String) {
        if self.customFailureView == nil {
                self.customFailureView = Bundle.main.loadNibNamed("CustomFailScreen", owner: nil, options: nil)?.first as? CustomFailScreen
                customFailureView?.setViewData(message: message)
                customFailureView?.frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: 100)
                customFailureView?.backgroundColor = .clear
                guard let customView = self.customFailureView else {
                  return
                }
                self.view.addSubview(customView)
            
        }
       
    }
    func hideWarningView () {
        self.customFailureView?.removeFromSuperview()
    }
}

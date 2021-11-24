//
//  UIViewExt.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation
import UIKit
extension UIView {
    // get parent viewcontroller
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
// to add corner radius to view from storyboard
extension UIView {
    @IBInspectable var cornersRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    func roundedView() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
    func roundedBottomCorners() {
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.frame
        rectShape.position = self.center
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        self.layer.mask = rectShape
    }
    func roundedTopCorners() {
         let rectShape = CAShapeLayer()
         rectShape.bounds = self.frame
         rectShape.position = self.center
         rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
         self.layer.mask = rectShape
     }
    func removeRoundedCorners() {
        self.layer.mask = nil
    }
}


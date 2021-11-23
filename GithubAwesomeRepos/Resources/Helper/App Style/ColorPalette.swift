//
//  ColorPalette.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation
import UIKit
protocol ColorPalette {
    var actionColor: UIColor { get }
    var basicBackgroundColor: UIColor { get }
    var headTextColor: UIColor { get }
    var titleTextColor: UIColor { get }
    var smallTextColor: UIColor { get }
}
struct ColorPaletteOne: ColorPalette {
     var headTextColor: UIColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
     var titleTextColor: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
     var smallTextColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
     var actionColor: UIColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
     var basicBackgroundColor: UIColor = #colorLiteral(red: 0.470497191, green: 0.675825417, blue: 1, alpha: 0.5)
    static let shared = ColorPaletteOne()
    private init() {}
}
struct ColorPaletteTwo: ColorPalette {
     var headTextColor: UIColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
     var titleTextColor: UIColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
     var smallTextColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
     var actionColor: UIColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
     var basicBackgroundColor: UIColor = .white
    static let shared = ColorPaletteTwo()
    private init() {}
}
enum ColorPaletteTypes {
case colorPaletteOne
case colorPaletteSecond
}

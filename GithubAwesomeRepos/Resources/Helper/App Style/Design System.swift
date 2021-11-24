//
//  Design System.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
/**
 - This class to set app design system(theme, font ..etc) from one place
 - Here i applied one example for app color palette also to restric using specific required app rules(like choose from our provided colors) so we can force it maybe with xiblint pod.
 - To update all App Design immediatly (espacially the screen which theme will change in), we can use notification center (one to many delegator).
 */
class DesignSystem {
    static let shared = DesignSystem()
    private init() {
        currentColorPaletteType = .colorPaletteOne
    }
    var currentColorPaletteType: ColorPaletteTypes {
        didSet {
            setupColorPalette()
        }
    }
    private(set) var choosedColorPalette: ColorPalette = ColorPaletteOne.shared
    private func setupColorPalette () {
        switch currentColorPaletteType {
        case .colorPaletteOne:
            choosedColorPalette = ColorPaletteOne.shared
        case .colorPaletteSecond:
            choosedColorPalette = ColorPaletteTwo.shared
        }
    }
}

//
//  Design System.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 23/11/2021.
//

import Foundation
/**
 This class to set app design system(theme, font ..etc) from one place , here i applied one example for app color palette
 also to restric using specific required app rules we can force it maybe with xiblint pod.
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

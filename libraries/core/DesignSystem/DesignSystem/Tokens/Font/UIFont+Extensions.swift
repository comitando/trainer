import UIKit
import SwiftUI

public extension UIFont {
    static func fontFrom(font: DSFont, size: CGFloat) -> UIFont? {
        font.registerFonts()
        return .init(name: font.rawValue, size: size)
    }
}

public extension Font {
    static func fontFrom(font: DSFont, size: CGFloat) -> Font {
        font.registerFonts()
        return Font.custom(font.rawValue, size: size)
    }
}

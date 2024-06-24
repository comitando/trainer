import UIKit

public extension UIFont {
    static func fontFrom(font: DSFont, size: CGFloat) -> UIFont? {
        font.registerFonts()
        return .init(name: font.rawValue, size: size)
    }
}

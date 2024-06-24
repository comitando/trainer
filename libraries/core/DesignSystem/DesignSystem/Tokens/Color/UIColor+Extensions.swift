import UIKit

public extension UIColor {
    static func colorFrom(color: DSColor) -> UIColor? {
        color.color
    }
    
    static func colorFrom(color: DSColor, opacity: DSOpacity) -> UIColor? {
        color.color?.withAlphaComponent(opacity.alpha)
    }
}

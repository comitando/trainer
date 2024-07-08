import UIKit
import SwiftUI

public extension UIColor {
    static func colorFrom(color: DSColor) -> UIColor? {
        color.color
    }
    
    static func colorFrom(color: DSColor, opacity: DSOpacity) -> UIColor? {
        color.color?.withAlphaComponent(opacity.alpha)
    }
}

public extension Color {
    static func colorFrom(dsColor: DSColor) -> Color? {
        if let uiColor = dsColor.color {
            return Color(uiColor)
        }
        return nil
    }
    
    static func colorFrom(dsColor: DSColor, opacity: DSOpacity) -> Color? {
        if let uiColor = dsColor.color {
            return Color(uiColor).opacity(Double(opacity.alpha))
        }
        return nil
    }
}

import UIKit
import SwiftUI

public extension UIImage {
    static func imageFrom(_ image: DSImage) -> UIImage? {
        image.image()
    }
}

public extension Image {
    static func imageFrom(_ image: DSImage) -> Image? {
        if let image = image.image() {
            return Image(uiImage: image)
        }
        return nil
    }
}


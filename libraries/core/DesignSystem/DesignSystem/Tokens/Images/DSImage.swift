import UIKit

public enum DSImage: String {
    case fullscreenImage = "fullscreen-image"
    
    func image() -> UIImage? {
        let bundle = Bundle(for: DSAssets.self)
        return .init(named: self.rawValue, in: bundle, compatibleWith: nil)
    }
}

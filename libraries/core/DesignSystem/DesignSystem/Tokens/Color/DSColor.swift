import UIKit

public enum DSColor: String {
    case alert = "alert"
    case success = "success"
    case primary = "primary"
    case accent = "accent"
    case neutralSoftest = "neutral_softest"
    case neutralSoft = "neutral_soft"
    case neutralStrong = "neutral_strong"
    case neutralStronger = "neutral_stronger"
    
    var color: UIColor? {
        let bundle = Bundle(for: DSAssets.self)
        return .init(named: self.rawValue, in: bundle, compatibleWith: nil)
    }
}

import UIKit

public enum DSOpacity: CGFloat {
    case opacity900 = 0.9
    case opacity700 = 0.7
    case opacity500 = 0.5
    
    var alpha: CGFloat {
        self.rawValue
    }
}

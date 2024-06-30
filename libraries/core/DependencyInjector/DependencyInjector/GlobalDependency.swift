import Foundation
import Swinject

public final class GlobalDependency {
    public static let container = Container()
}

public extension ObjectScope {
    static let session = ObjectScope(storageFactory: PermanentStorage.init)
}

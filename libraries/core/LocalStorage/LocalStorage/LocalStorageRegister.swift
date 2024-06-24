import Foundation
import DependencyInjector

public final class LocalStorageRegister: RegisterDependenciesProtocol {
    public static func register(container: ContainerRegisterProtocol) {
        container.register(LocalCacheInterface.self) { _ in
            return LocalCache(userDefault: .standard)
        }
    }
}

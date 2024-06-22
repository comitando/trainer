import Foundation
import DependencyInjector

final class LocalStorageRegister: RegisterDependenciesProtocol {
    static func register(container: ContainerRegisterProtocol) {
        container.register(LocalCacheInterface.self) { _ in
            return LocalCache(userDefault: .standard)
        }
    }
}

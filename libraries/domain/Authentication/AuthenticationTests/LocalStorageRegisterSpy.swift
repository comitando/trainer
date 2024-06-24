import Foundation
import LocalStorage
import DependencyInjector

extension LocalStorageRegister {
    public static func registerDummy(container: ContainerRegisterProtocol) {
        container.autoregister(LocalCacheInterface.self, initializer: LocalCacheInterfaceSpy.init).inObjectScope(.weak)
    }
}

final class LocalCacheInterfaceSpy: LocalCacheInterface {
    
    enum Methods: Equatable {
        case save(String)
        case delete(String)
        case load(String)
    }
    
    private(set) var methodsCalled: [Methods] = []
    
    func save(item: Any, key: String) {
        methodsCalled.append(.save(key))
    }
    
    func delete(key: String) {
        methodsCalled.append(.delete(key))
    }
    
    var returnedLoadValue: Any? = nil
    func load(key: String) -> Any? {
        methodsCalled.append(.load(key))
        return returnedLoadValue
    }
    
}

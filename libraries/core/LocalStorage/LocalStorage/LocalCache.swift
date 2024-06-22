import Foundation

final class LocalCache {
    private let userDefault: UserDefaults
    
    init(userDefault: UserDefaults) {
        self.userDefault = userDefault
    }
}

extension LocalCache: LocalCacheInterface {
    func save(item: Any, key: String) {
        userDefault.setValue(item, forKey: key)
    }
    
    func delete(key: String) {
        userDefault.removeObject(forKey: key)
    }
    
    func load(key: String) -> Any? {
        userDefault.object(forKey: key)
    }
}

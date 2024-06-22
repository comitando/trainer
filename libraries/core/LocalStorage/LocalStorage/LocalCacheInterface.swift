import Foundation

public protocol LocalCacheInterface {
    func save(item: Any, key: String)
    func delete(key: String)
    func load(key: String) -> Any?
}

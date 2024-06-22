import Foundation

public protocol Database<T> {
    associatedtype T
    
    func create(_ item: T) throws
    func create(_ items: [T]) throws
    func load(sortBy sortDescriptors: SortDescriptor<T>...) async throws -> [T]
    func search(predicate: Predicate<T>?, sortBy sortDescriptors: SortDescriptor<T>...) async throws -> [T]
    func delete(_ item: T) throws
}

import Foundation
import SwiftData

public protocol SwiftDatabase<T>: Database {
    associatedtype T = PersistentModel
    var container: ModelContainer { get }
}

public extension SwiftDatabase {
    
    func create<T: PersistentModel>(_ items: [T]) throws {
        let context = ModelContext(container)
        for item in items {
            context.insert(item)
        }
        try context.save()
    }
    
    func create<T: PersistentModel>(_ item: T) throws {
        let context = ModelContext(container)
        context.insert(item)
        try context.save()
    }
    
    func load<T: PersistentModel>(sortBy sortDescriptors: SortDescriptor<T>...) throws -> [T] {
        let context = ModelContext(container)
        let fetchDescriptor = FetchDescriptor<T>(
            sortBy: sortDescriptors
        )
        return try context.fetch(fetchDescriptor)
    }
    
    func search<T: PersistentModel>(predicate: Predicate<T>?, sortBy sortDescriptors: SortDescriptor<T>...) throws -> [T] {
        let context = ModelContext(container)
        let fetchDescriptor = FetchDescriptor<T>(predicate: predicate, sortBy: sortDescriptors)
        return try context.fetch(fetchDescriptor)
    }
    
    func delete<T: PersistentModel>(_ item: T) throws {
        let context = ModelContext(container)
        let idToDelete = item.persistentModelID
        try context.delete(model: T.self, where: #Predicate { item in
            item.persistentModelID == idToDelete
        })
        try context.save()
    }
    
}

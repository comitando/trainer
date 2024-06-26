import Foundation
import LocalStorage
import SwiftData

final class UserAccountData: SwiftDatabase {
    typealias T = UserAccountModel
    internal let container: ModelContainer
    
    init(useInMemoryStore: Bool = false) throws {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: useInMemoryStore)
        container = try ModelContainer(for: UserAccountModel.self, configurations: configuration)
    }
}

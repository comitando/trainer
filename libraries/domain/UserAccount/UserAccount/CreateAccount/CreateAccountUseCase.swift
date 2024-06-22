import CryptoKit
import Foundation
import UserAccountInterface
import LocalStorage

final class CreateAccountUseCase: UserAccountInterface {
    
    private let database: CreateAccountData
    private let sortByDefault: SortDescriptor = SortDescriptor<UserAccountModel>(\.name)
    
    init(database: CreateAccountData) {
        self.database = database
    }
    
    func createAccount(_ data: UserAccount) throws {
        let id: String = data.id.uuidString
        let predicate = #Predicate<UserAccountModel> { $0.id.uuidString.contains(id) }
        
        guard try database.search(predicate: predicate, sortBy: sortByDefault).isEmpty else {
            throw UserAccountState.userExists(data.email)
        }
        
        try database.create(data.toModel()) 
    }
    
}

extension UserAccount {
    func toModel() -> UserAccountModel {
        return UserAccountModel(
            id: id,
            email: email,
            name: name,
            gender: gender.rawValue,
            birthday: birthday
        )
    }
}

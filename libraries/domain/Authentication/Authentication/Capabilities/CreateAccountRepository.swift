import CryptoKit
import Foundation
import AuthenticationInterface
import LocalStorage

final class CreateAccountRepository: UserAccountInterface {
    
    private let database: UserAccountData
    private let sortByDefault: SortDescriptor = SortDescriptor<UserAccountModel>(\.name)
    
    init(database: UserAccountData) {
        self.database = database
    }
    
    func createAccount(_ data: UserAccount, keepLoggedIn: Bool = true) throws {
        let email: String = data.email
        let predicate = #Predicate<UserAccountModel> { $0.email.localizedStandardContains(email) }
        
        guard try database.search(predicate: predicate, sortBy: sortByDefault).isEmpty else {
            throw UserAccountError.userExists(data.email)
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

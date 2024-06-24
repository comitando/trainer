import Foundation
import AuthenticationInterface

final class LoginRepository: LoginInterface {
    
    private let database: UserAccountData
    private let sortByDefault: SortDescriptor = SortDescriptor<UserAccountModel>(\.name)
    
    init(database: UserAccountData) {
        self.database = database
    }
    
    func auth(email: String, keepLoggedIn: Bool = false) throws -> Result<UserAccount, UserAccountError> {
        let predicate = #Predicate<UserAccountModel> { $0.email.localizedStandardContains(email) }
        guard let dataModel = try database.search(predicate: predicate, sortBy: sortByDefault).first else {
            return .failure(.notFound)
        }
        return .success(dataModel.toModel())
    }
    
}

extension UserAccountModel {
    func toModel() -> UserAccount {
        return UserAccount(
            id: id,
            name: name,
            email: email,
            gender: UserAccountGender(rawValue: gender)!,
            birthday: birthday
        )
    }
}

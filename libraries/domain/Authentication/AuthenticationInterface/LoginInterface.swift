import Foundation

public protocol LoginInterface {
    func auth(email: String) throws -> Result<UserAccount, UserAccountError>
}

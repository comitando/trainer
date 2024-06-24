import Foundation

public protocol LoginInterface {
    func auth(email: String, keepLoggedIn: Bool) throws -> Result<UserAccount, UserAccountError>
}

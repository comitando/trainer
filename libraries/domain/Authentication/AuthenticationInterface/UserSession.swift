import Foundation

public protocol UserSession {
    var userAccount: UserAccount? { get }
    func keepLoggedIn() -> Result<String, UserAccountError>
    func restoreSession(_ email: String) -> Result<UserAccount, UserAccountError>
}

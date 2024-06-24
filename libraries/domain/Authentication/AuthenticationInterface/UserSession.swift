import Foundation

public protocol UserSession {
    func keepLoggedIn() -> Result<String, UserAccountError>
    func restoreSession(_ email: String) -> Result<UserAccount, UserAccountError>
}

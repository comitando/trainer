import Foundation

public protocol UserAccountInterface {
    func createAccount(_ data: UserAccount, keepLoggedIn: Bool) throws
}

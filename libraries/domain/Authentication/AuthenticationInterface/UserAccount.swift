import Foundation

public struct UserAccount: Equatable {
    public let id: UUID
    public let name: String
    public let email: String
    public let gender: UserAccountGender
    public let birthday: Date
    
    public init(
        id: UUID = UUID(),
        name: String,
        email: String,
        gender: UserAccountGender,
        birthday: Date
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.birthday = birthday
    }
    
}

public enum UserAccountKeepLoggedIn {
    public static var key = "UserAccountKeepLogged"
}

public enum UserAccountGender: String, CaseIterable, Identifiable {
    case male = "musculino"
    case female = "feminino"
    
    public var id: String { self.rawValue }
}

public enum UserAccountError: Error, Equatable {
    case notFound
    case userExists(String)
}

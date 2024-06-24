import Foundation
import SwiftData

@Model
final class UserAccountModel {
    @Attribute(.unique) let email: String
    
    let id: UUID
    let name: String
    let gender: String
    let birthday: Date
    
    init(
        id: UUID = UUID(),
        email: String,
        name: String,
        gender: String,
        birthday: Date
    ) {
        self.id = id
        self.email = email
        self.name = name
        self.gender = gender
        self.birthday = birthday
    }
    
}

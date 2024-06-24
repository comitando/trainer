import Foundation
import DependencyInjector
import AuthenticationInterface
@testable import Authentication

extension AuthenticationRegister {
    public static func registerDummy(container: ContainerRegisterProtocol) {
        container.autoregister(LoginInterface.self, name: "Repository", initializer: LoginUseCaseSpy.init).inObjectScope(.weak)
        container.autoregister(UserAccountInterface.self, name: "Repository", initializer: CreateAccountUseCaseSpy.init).inObjectScope(.weak)
    }
}

final class CreateAccountUseCaseSpy: UserAccountInterface {
    
    var returnedError: Bool = false
    func createAccount(_ data: UserAccount, keepLoggedIn: Bool) throws {
        if returnedError {
            throw UserAccountError.userExists("test")
        }
    }
    
}

final class LoginUseCaseSpy: LoginInterface {
    
    var returnedResult: Result<UserAccount, UserAccountError>?
    var returnedThrows: Bool = false
    
    func auth(email: String, keepLoggedIn: Bool) throws -> Result<UserAccount, UserAccountError> {
        if returnedThrows {
            throw UserAccountError.notFound
        }
        return returnedResult ?? .success(.init(name: "name", email: "email", gender: .male, birthday: .now))
    }
    
}

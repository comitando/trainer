import Foundation
import DependencyInjector
import AuthenticationInterface
import LocalStorage

public final class AuthenticationRegister: RegisterDependenciesProtocol {
    public static func register(container: ContainerRegisterProtocol) {
        container.autoregister(LoginInterface.self, initializer: LoginUseCase.init)
        container.autoregister(UserAccountInterface.self, initializer: CreateAccountUseCase.init)
        container.register(UserAccountData.self) { _ in
            do {
                return try UserAccountData()
            } catch {
                fatalError("Unable to create ModelContainer \(error.localizedDescription)")
            }
        }.inObjectScope(.container)
    }
}

import Foundation
import AuthenticationInterface
import LocalStorage
import DependencyInjector

final class UserSessionManager {
    
    @Inject(name: "Repository") private var useCase: LoginInterface
    @Inject private var localCache: LocalCacheInterface
    
    private(set) var userData: UserAccount?
}

extension UserSessionManager: UserSession {
    func keepLoggedIn() -> Result<String, UserAccountError> {
        guard let email = localCache.load(key: UserAccountKeepLoggedIn.key) as? String else {
            return .failure(.notFound)
        }
        return .success(email)
    }
    
    func restoreSession(_ email: String) -> Result<UserAccount, UserAccountError> {
        do {
            let result = try useCase.auth(email: email, keepLoggedIn: true)
            _ = result.map { [weak self] newUser in self?.userData = newUser }
            return result
        } catch {
            return .failure(.notFound)
        }
    }
}

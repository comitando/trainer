import Foundation
import AuthenticationInterface
import LocalStorage
import DependencyInjector

final class UserSessionManager: UserSession {
    
    @Inject(name: "Repository") private var useCase: LoginInterface
    @Inject private var localCache: LocalCacheInterface
    
    private(set) var userAccount: UserAccount?
    
    func keepLoggedIn() -> Result<String, UserAccountError> {
        guard let email = localCache.load(key: UserAccountKeepLoggedIn.key) as? String else {
            return .failure(.notFound)
        }
        return .success(email)
    }
    
    func restoreSession(_ email: String) -> Result<UserAccount, UserAccountError> {
        do {
            let result = try useCase.auth(email: email, keepLoggedIn: true)
            _ = result.map { [weak self] newUser in self?.userAccount = newUser }
            return result
        } catch {
            return .failure(.notFound)
        }
    }
}

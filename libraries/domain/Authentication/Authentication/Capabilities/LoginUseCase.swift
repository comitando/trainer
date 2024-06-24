import Foundation
import AuthenticationInterface
import LocalStorage
import DependencyInjector

final class LoginUseCase: LoginInterface {
    
    @Inject(name: "Repository") private var useCase: LoginInterface
    @Inject private var localCache: LocalCacheInterface
    
    func auth(email: String, keepLoggedIn: Bool) throws -> Result<UserAccount, UserAccountError> {
        let result = try useCase.auth(email: email, keepLoggedIn: keepLoggedIn)
        switch result {
        case .success where keepLoggedIn: 
            localCache.save(item: email, key: UserAccountKeepLoggedIn.key)
        default: break
        }
        return result
    }
}

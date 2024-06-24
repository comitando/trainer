import Foundation
import AuthenticationInterface
import LocalStorage
import DependencyInjector

final class CreateAccountUseCase: UserAccountInterface {
    
    @Inject(name: "Repository") private var useCase: UserAccountInterface
    @Inject private var localCache: LocalCacheInterface
    
    func createAccount(_ data: UserAccount, keepLoggedIn: Bool) throws {
        try useCase.createAccount(data, keepLoggedIn: keepLoggedIn)
        if keepLoggedIn {
            localCache.save(item: data.email, key: UserAccountKeepLoggedIn.key)
        }
    }
    
}

import XCTest
import AuthenticationInterface
import DependencyInjector
import LocalStorage
@testable import Authentication

final class CreateAccountUseCaseTests: XCTestCase {
    
    let container = GlobalDependency.container
    private lazy var localCacheSpy: LocalCacheInterfaceSpy? = {
        let resolver = container.resolveDependency(LocalCacheInterface.self)
        return resolver as? LocalCacheInterfaceSpy
    }()
    
    private lazy var userAccountSpy: CreateAccountUseCaseSpy? = {
        let resolver = container.resolveDependency(UserAccountInterface.self, name: "Repository")
        return resolver as? CreateAccountUseCaseSpy
    }()
    
    override func setUp() {
        super.setUp()
        container.removeAll()
        AuthenticationRegister.registerDummy(container: container)
        LocalStorageRegister.registerDummy(container: container)
    }
    
    func testCreateAccountComposite_createAccount_andPersistskeepLogged() throws {
        let sut = CreateAccountUseCase()
        let data = UserAccount(name: "name", email: "email", gender: .male, birthday: .now)
        
        try sut.createAccount(data, keepLoggedIn: true)
        
        XCTAssertEqual(localCacheSpy?.methodsCalled, [.save(UserAccountKeepLoggedIn.key)])
    }
    
    func testCreateAccountComposite_createAccount_andNotPersistskeepLogged() throws {
        let sut = CreateAccountUseCase()
        let data = UserAccount(name: "name", email: "email", gender: .male, birthday: .now)
        
        do {
            userAccountSpy?.returnedError = true
            try sut.createAccount(data, keepLoggedIn: true)
            XCTFail("expected failure but retorned success")
        } catch {
            XCTAssertEqual(localCacheSpy?.methodsCalled, [])
        }
    }
}

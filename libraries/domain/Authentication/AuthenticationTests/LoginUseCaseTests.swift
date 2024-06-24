import XCTest
import AuthenticationInterface
import DependencyInjector
import LocalStorage
@testable import Authentication

final class LoginUseCaseTests: XCTestCase {
    
    let container = GlobalDependency.container
    
    private lazy var localCacheSpy: LocalCacheInterfaceSpy? = {
        let resolver = container.resolveDependency(LocalCacheInterface.self)
        return resolver as? LocalCacheInterfaceSpy
    }()
    
    private lazy var loginSpy: LoginUseCaseSpy? = {
        let resolver = container.resolveDependency(LoginInterface.self, name: "Repository")
        return resolver as? LoginUseCaseSpy
    }()
    
    override func setUp() {
        super.setUp()
        container.removeAll()
        AuthenticationRegister.registerDummy(container: container)
        LocalStorageRegister.registerDummy(container: container)
    }
    
    func testLoginUseCase_auth_andPersistskeepLogged() throws {
        let sut = LoginUseCase()
        
        _ = try sut.auth(email: "email", keepLoggedIn: true)
        
        XCTAssertEqual(localCacheSpy?.methodsCalled, [.save(UserAccountKeepLoggedIn.key)])
    }
    
    func testLoginUseCase_auth_andNotPersistskeepLogged() throws {
        let sut = LoginUseCase()
        
        _ = try sut.auth(email: "email", keepLoggedIn: false)
        
        XCTAssertEqual(localCacheSpy?.methodsCalled, [])
    }
    
    func testLoginUseCase_authReturnedError_andNotPersistskeepLogged() throws {
        let sut = LoginUseCase()
        loginSpy?.returnedResult = .failure(.notFound)
        
        _ = try sut.auth(email: "email", keepLoggedIn: true)
        
        XCTAssertEqual(localCacheSpy?.methodsCalled, [])
    }
    
    func testLoginUseCase_authReturnedThrow_andNotPersistskeepLogged() throws {
        let sut = LoginUseCase()
        
        do {
            loginSpy?.returnedThrows = true
            _ = try sut.auth(email: "email", keepLoggedIn: true)
            XCTFail("expected failure but retorned success")
        } catch {
            XCTAssertEqual(localCacheSpy?.methodsCalled, [])
        }
    }
}

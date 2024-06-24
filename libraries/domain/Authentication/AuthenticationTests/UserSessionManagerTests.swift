import XCTest
import AuthenticationInterface
import DependencyInjector
import LocalStorage
@testable import Authentication

final class UserSessionManagerTests: XCTestCase {
    
    let container = GlobalDependency.container
    
    private lazy var localCacheSpy: LocalCacheInterfaceSpy? = {
        let resolver = container.resolveDependency(LocalCacheInterface.self)
        return resolver as? LocalCacheInterfaceSpy
    }()
    
    private lazy var userAccountSpy: LoginUseCaseSpy? = {
        let resolver = container.resolveDependency(LoginInterface.self, name: "Repository")
        return resolver as? LoginUseCaseSpy
    }()
    
    override func setUp() {
        super.setUp()
        container.removeAll()
        AuthenticationRegister.registerDummy(container: container)
        LocalStorageRegister.registerDummy(container: container)
    }
    
    func testUserSessionManager_keepLoggedIn() {
        let sut = UserSessionManager()
        let expectedResult = "test"
        localCacheSpy?.returnedLoadValue = expectedResult
        
        let result = sut.keepLoggedIn()
        XCTAssertEqual(result, .success(expectedResult))
    }
    
    func testUserSessionManager_keepLoggedIn_returnedFailure() {
        let sut = UserSessionManager()
        
        let result = sut.keepLoggedIn()
        XCTAssertEqual(result, .failure(.notFound))
    }
    
    func testUserSessionManager_restoreSession() {
        let sut = UserSessionManager()
        
        _ = sut.restoreSession("email")
        
        XCTAssertNotNil(sut.userData)
    }
    
    func testUserSessionManager_restoreSession_returnedFailure() {
        let sut = UserSessionManager()
        userAccountSpy?.returnedResult = .failure(.notFound)
        
        _ = sut.restoreSession("email")
        
        XCTAssertNil(sut.userData)
    }
    
    func testUserSessionManager_restoreSession_returnedThrows() {
        let sut = UserSessionManager()
        userAccountSpy?.returnedThrows = true
        
        _ = sut.restoreSession("email")
        
        XCTAssertNil(sut.userData)
    }
    
}

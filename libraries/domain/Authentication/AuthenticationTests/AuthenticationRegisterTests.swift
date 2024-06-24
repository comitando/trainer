import XCTest
import AuthenticationInterface
import DependencyInjector
import LocalStorage
@testable import Authentication

final class AuthenticationRegisterTests: XCTestCase {

    let container = GlobalDependency.container
    
    override func setUp() {
        super.setUp()
        container.removeAll()
        AuthenticationRegister.register(container: container)
        LocalStorageRegister.registerDummy(container: container)
    }
    
    func testAuthenticationRegister_register() {
        XCTAssertNotNil(container.resolve(LoginInterface.self))
        XCTAssertNotNil(container.resolve(UserAccountInterface.self))
        XCTAssertNotNil(container.resolve(UserAccountData.self))
    }
    
    func testAuthenticationRegister_register_sameUserAccountDataObj() {
        let objOne = container.resolve(UserAccountData.self)
        let objTwo = container.resolve(UserAccountData.self)
        
        XCTAssertTrue(objOne === objTwo)
    }
    
    func testAuthenticationRegister_validateInstances() {
        let resolverOne = container.resolve(LoginInterface.self)
        let resolverTwo = container.resolve(UserAccountInterface.self)
        
        XCTAssertNotNil(resolverOne)
        XCTAssertTrue(resolverOne is LoginUseCase)
        
        XCTAssertNotNil(resolverTwo)
        XCTAssertTrue(resolverTwo is CreateAccountUseCase)
    }
    
}

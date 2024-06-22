import XCTest
import AuthenticationInterface
import DependencyInjector
@testable import Authentication

final class AuthenticationRegisterTests: XCTestCase {

    let container = GlobalDependency.container
    
    override func setUp() {
        super.setUp()
        container.removeAll()
    }
    
    func testAuthenticationRegister_register() {
        AuthenticationRegister.register(container: container)
        
        XCTAssertNotNil(container.resolve(LoginInterface.self))
        XCTAssertNotNil(container.resolve(UserAccountInterface.self))
        XCTAssertNotNil(container.resolve(UserAccountData.self))
    }
    
    func testAuthenticationRegister_register_sameUserAccountDataObj() {
        AuthenticationRegister.register(container: container)
        
        let objOne = container.resolve(UserAccountData.self)
        let objTwo = container.resolve(UserAccountData.self)
        
        XCTAssertTrue(objOne === objTwo)
    }
    
}

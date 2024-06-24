import XCTest
import DependencyInjector
@testable import LocalStorage

final class LocalStorageRegisterTests: XCTestCase {

    let container = GlobalDependency.container
    
    override func setUp() {
        super.setUp()
        container.removeAll()
    }
    
    func testAuthenticationRegister_register() {
        LocalStorageRegister.register(container: container)
        
        XCTAssertNotNil(container.resolve(LocalCacheInterface.self))
    }
    
}

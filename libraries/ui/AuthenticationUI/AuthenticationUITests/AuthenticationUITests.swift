import XCTest
@testable import AuthenticationUI

final class AuthenticationUIInitializerTests: XCTestCase {
    func test_helloWorld() {
        let sut = AuthenticationUIInitializer()
        let result = sut.helloWorld()
        XCTAssertEqual(result, "AuthenticationUI")
    }
}
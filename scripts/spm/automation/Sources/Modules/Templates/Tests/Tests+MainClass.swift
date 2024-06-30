import Foundation

extension TestTemplates {
    
    static func mainClass(_ moduleName: String) -> String {
        """
        import XCTest
        @testable import \(moduleName)

        final class \(moduleName)InitializerTests: XCTestCase {
            func test_helloWorld() {
                let sut = \(moduleName)Initializer()
                let result = sut.helloWorld()
                XCTAssertEqual(result, "\(moduleName)")
            }
        }
        """
    }
}

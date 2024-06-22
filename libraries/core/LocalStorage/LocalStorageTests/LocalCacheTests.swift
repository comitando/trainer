import SwiftData
import XCTest
@testable import LocalStorage

final class LocalCacheTests: XCTestCase {
 
    override func setUp() {
        super.setUp()
        UserDefaults.resetStandardUserDefaults()
    }
    
    func testLocalCache_saveItem() {
        let result = save(item: true)
        XCTAssertTrue(result ?? false)
    }
    
    func testLocalCache_changeItem() {
        let result = save(item: true)
        XCTAssertTrue(result ?? false)
        
        let secondResult = save(item: false)
        XCTAssertFalse(secondResult ?? true)
    }
    
    func testLocalCache_deleteItem() {
        let sut = LocalCache(userDefault: .standard)
        let key = "testLocalCache_deleteItem"
        
        let result = save(sut: sut, item: true, key: key)
        XCTAssertTrue(result ?? false)
        
        sut.delete(key: key)
        XCTAssertNil(sut.load(key: key))
    }
    
}

private extension LocalCacheTests {
    func save(
        sut: LocalCache = LocalCache(userDefault: .standard),
        item: Any,
        key: String = "LocalCacheTests"
    ) -> Bool? {
        sut.save(item: item, key: key)
        return sut.load(key: key) as? Bool
    }
}

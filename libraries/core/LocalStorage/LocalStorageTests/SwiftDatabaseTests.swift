import SwiftData
import XCTest
@testable import LocalStorage

final class SwiftDatabaseTests: XCTestCase {
    
    func testSwiftDatabase_createData() throws {
        let sut = try MockDB()
        
        let model = Mock(name: "testSwiftDatabase_createData")
        
        try create(sut: sut, items: [model])
    }
    
    func testSwiftDatabase_createMultipleData() throws {
        let sut = try MockDB()
        
        let modelOne = Mock(name: "testSwiftDatabase_createMultipleData_one")
        let modelTwo = Mock(name: "testSwiftDatabase_createMultipleData_two")
        
        try create(sut: sut, items: [modelOne, modelTwo])
    }
    
    func testSwiftDatabase_readAfterCreateData() throws {
        let sut = try MockDB()
        let model = Mock(name: "testSwiftDatabase_createData")
        try create(sut: sut, items: [model])
        
        let result = try sut.read(sortBy: SortDescriptor<Mock>(\.name))
        
        XCTAssertEqual(result.count, 1)
    }
    
    func testSwiftDatabase_deleteAfterCreateData() throws {
        let sut = try MockDB()
        let model = Mock(name: "testSwiftDatabase_createMultipleData_one")
        try create(sut: sut, items: [model])
        
        do {
            try sut.delete(model)
            XCTAssertTrue(true, "model deleted successfully")
        } catch {
            XCTFail("expected success but returned \(error.localizedDescription)")
        }
    }
}

private extension SwiftDatabaseTests {
    func create(sut: MockDB, items: [Mock], file: StaticString = #filePath, line: UInt = #line) throws {
        do {
            try sut.create(items)
            XCTAssertTrue(true, "model created successfully", file: file, line: line)
        } catch {
            XCTFail("expected success but returned \(error.localizedDescription)")
        }
    }
}

@Model
class Mock {
    @Attribute(.unique) let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

final class MockDB: SwiftDatabase {
    
    typealias T = Mock
    let container: ModelContainer
    
    init(useInMemoryStore: Bool = true) throws {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: useInMemoryStore)
        container = try ModelContainer(for: Mock.self, configurations: configuration)
    }
}

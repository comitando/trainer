import SwiftData
import XCTest
@testable import LocalStorage

final class SwiftDatabaseTests: XCTestCase {
    
    func testSwiftDatabase_createData() throws {
        let sut = try MockDB()
        
        let model = Mock(name: "testSwiftDatabase_createData")
        
        do {
            try sut.create(model)
            XCTAssertTrue(true, "model created successfully")
        } catch {
            XCTFail("expected success but returned \(error.localizedDescription)")
        }
    }
    
    func testSwiftDatabase_createMultipleData() throws {
        let sut = try MockDB()
        
        let modelOne = Mock(name: "testSwiftDatabase_createMultipleData_one")
        let modelTwo = Mock(name: "testSwiftDatabase_createMultipleData_two")
        
        do {
            try sut.create([modelOne, modelTwo])
            XCTAssertTrue(true, "model created successfully")
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

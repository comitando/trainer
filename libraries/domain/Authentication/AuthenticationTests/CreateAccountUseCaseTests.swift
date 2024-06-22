import XCTest
import AuthenticationInterface
@testable import Authentication

final class CreateAccountUseCaseTests: XCTestCase {
        
    func testCreateAccountUseCase_createAccount() throws {
        let (sut, database) = try make()
        let data = UserAccount(name: "name", email: "email", gender: .male, birthday: .now)
        
        try sut.createAccount(data)
        let result = try database.load(sortBy: SortDescriptor<UserAccountModel>(\.name))
        
        XCTAssertEqual(result.count, 1)
    }
    
    func testCreateAccountUseCase_createMultipleAccount() throws {
        let (sut, database) = try make()
        let dataOne = UserAccount(name: "name", email: "email", gender: .male, birthday: .now)
        let dataTwo = UserAccount(name: "name", email: "email@email", gender: .male, birthday: .now)
        
        try sut.createAccount(dataOne)
        try sut.createAccount(dataTwo)
        let result = try database.load(sortBy: SortDescriptor<UserAccountModel>(\.name))
        
        XCTAssertEqual(result.count, 2)
    }
    
    func testCreateAccountUseCase_createAccount_returnError() throws {
        let (sut, _) = try make()
        let dataOne = UserAccount(name: "name", email: "email", gender: .male, birthday: .now)
        let dataTwo = UserAccount(name: "name", email: "email", gender: .male, birthday: .now)
        
        try sut.createAccount(dataOne)
        
        do {
            try sut.createAccount(dataTwo)
            XCTFail("Expected error when creating duplicate user, but returned success")
        } catch let error {
            XCTAssertEqual(error as! UserAccountError, .userExists("email"))
        }
    }
    
}

private extension CreateAccountUseCaseTests {
    
    func make() throws -> (sut: CreateAccountUseCase, database: UserAccountData) {
        let database = try UserAccountData(useInMemoryStore: true)
        let sut = CreateAccountUseCase(database: database)
        return (sut, database)
    }
}

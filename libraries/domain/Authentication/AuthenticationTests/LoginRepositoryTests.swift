import XCTest
import AuthenticationInterface
@testable import Authentication

final class LoginRepositoryTests: XCTestCase {
        
    func testLoginUseCase_auth() throws {
        let (sut, database) = try make()
        let expectedData = try mockAccount(database)
        
        let result = try sut.auth(email: expectedData.email)
        
        switch result {
        case .success(let model):
            XCTAssertEqual(model, expectedData.toModel())
        case .failure(let error):
            XCTFail("expected success but returned \(error.localizedDescription)")
        }
    }
    
    func testLoginUseCase_auth_returnedNotFound() throws {
        let (sut, database) = try make()
        try mockAccount(database)
        
        let result = try sut.auth(email: "email@email")
        
        switch result {
        case .success(let model):
            XCTFail("expected failure but returned \(model.email)")
        case .failure(let error):
            XCTAssertEqual(error, UserAccountError.notFound)
        }
    }
    
}

private extension LoginRepositoryTests {
    
    func make() throws -> (sut: LoginRepository, database: UserAccountData) {
        let database = try UserAccountData(useInMemoryStore: true)
        let sut = LoginRepository(database: database)
        return (sut, database)
    }
    
    @discardableResult
    func mockAccount(_ database: UserAccountData) throws -> UserAccountModel {
        let data = UserAccountModel(email: "email", name: "name", gender: "male", birthday: .now)
        try database.create(data)
        return data
    }
}

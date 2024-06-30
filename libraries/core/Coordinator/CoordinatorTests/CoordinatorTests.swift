import XCTest
@testable import Coordinator

final class CoordinatorTests: XCTestCase {
    private var flowData: String = "FLOWDATA"
    
    func testNewInstances() {
        let sut = makeSUT()
        
        sut.startChildCoordinator()
        sut.startChildCoordinator()
        
        XCTAssertEqual(sut.childCoordinators.count, 2)
        XCTAssertTrue(sut.childCoordinators.first is MockChildCoordinator)
    }
    
    func testFinishInstances() {
        let sut = makeSUT()
        
        sut.startChildCoordinator()
        sut.finishChildCoordinator()
        
        XCTAssertEqual(sut.childCoordinators.count, 0)
    }
    
    func testFlowDataLoad() {
        let sut = makeSUT()
        
        sut.start(with: flowData)
        
        XCTAssertEqual(sut.data, flowData)
    }
}

private extension CoordinatorTests {
    func makeSUT() -> MockParentCoordinator {
        let navigationController = UINavigationController()
        let parentCoordinator = MockParentCoordinator.instance(navigationController: navigationController)
        return parentCoordinator
    }
}

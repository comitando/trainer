import UIKit
@testable import Coordinator

final class MockParentCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var data: String?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with data: String) {
        self.data = data
    }
    
    func start() { }
    
    func finish() { }
    
    func startChildCoordinator() {
        let childCoordinator = MockChildCoordinator.instance(parent: self, navigationController: navigationController)
        childCoordinator.start()
    }
    
    func finishChildCoordinator() {
        childCoordinators.first?.finish()
    }
}

final class MockChildCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setup(with data: Any?) { }
    
    func start() { }
    
    func finish() {
        finishCoordinator(self)
    }
}

import UIKit
import SwiftUI
import Coordinator

public final class AuthenticationCoordinator: Coordinator {
    public var parent: Coordinator?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {}
    public func finish() {}
    
    public func start() -> UINavigationController {
        navigationController.setViewControllers([introScreen()], animated: false)
        return navigationController
    }
}

private extension AuthenticationCoordinator {
    func introScreen() -> UIViewController {
        return UIHostingController(rootView: IntroScreen())
    }
}

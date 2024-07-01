import UIKit
import SwiftUI
import Coordinator

public protocol AuthCoordinator: Coordinator {
    func pushLogin()
    func pushCreateAccount()
}

public final class AuthenticationCoordinator: AuthCoordinator {
    public var parent: Coordinator?
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    
    public required init(navigationController: UINavigationController = .init()) {
        self.navigationController = navigationController
    }
    
    public func start() {}
    public func finish() {}
    
    public func start() -> UINavigationController {
        navigationController.setViewControllers([introScreen()], animated: false)
        return navigationController
    }
    
    public func pushLogin() {
        let controller = UIHostingController(rootView: Login())
        navigationController.pushViewController(controller, animated: true)
    }
    
    public func pushCreateAccount() {
        let controller = UIHostingController(rootView: SignUpView())
        navigationController.pushViewController(controller, animated: true)
    }
}

private extension AuthenticationCoordinator {
    func introScreen() -> UIViewController {
        let viewModel = IntroScreenViewModel(coordinator: self)
        let controller = IntroScreen(viewModel: viewModel)
        return UIHostingController(rootView: controller)
    }
}

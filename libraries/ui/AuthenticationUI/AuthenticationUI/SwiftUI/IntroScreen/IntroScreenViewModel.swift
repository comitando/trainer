import Foundation
import Coordinator
import SwiftUI

protocol IntroScreenInterface {
    func showCreateAccount()
    func showLogin()
}

final class IntroScreenViewModel {
    weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
}

extension IntroScreenViewModel: IntroScreenInterface {
    func showCreateAccount() {
        coordinator?.pushCreateAccount()
    }
    
    func showLogin() {
        coordinator?.pushLogin()
    }
}

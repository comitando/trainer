import Foundation
import Coordinator
import SwiftUI

final class IntroScreenViewModel {
    weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }

    func showCreateAccount() {
        coordinator?.pushCreateAccount()
    }
    
    func showLogin() {
        coordinator?.pushLogin()
    }
}

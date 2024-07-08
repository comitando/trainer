import SwiftUI
import Combine
import AuthenticationInterface
import DependencyInjector

final class LoginViewModel: ObservableObject {
    
    @Inject private var loginUseCase: LoginInterface
    
    @Published var email: String = ""
    @Published var isButtonDisabled: Bool = false
    @Published var stayLoggedIn: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
    weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
        $email
            .map { email in
                return !email.isEmpty && email.contains("@") && email.contains(".")
            }
            .assign(to: \.isButtonDisabled, on: self)
            .store(in: &cancellables)
    }
    
    func makeLogin() {
        do {
            let result = try loginUseCase.auth(email: email, keepLoggedIn: stayLoggedIn)
            switch result {
            case let .success(user):
                print("[Debug Info]: Bem vindo, \(user.name)")
                coordinator?.finish()
            case let .failure(error): 
                print("[Debug Info]: \(error.localizedDescription)")
            }
        } catch {
            print("[Debug Info]: \(error.localizedDescription)")
        }
    }
}

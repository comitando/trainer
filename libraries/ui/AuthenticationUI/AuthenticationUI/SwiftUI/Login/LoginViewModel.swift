import SwiftUI
import Combine
import AuthenticationInterface
import DependencyInjector

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var isButtonDisabled: Bool = false
    @Published var stayLoggedIn: Bool = true
    @Inject private var loginUseCase: LoginInterface
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
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
            case .success(let model):
                print(model.name)
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

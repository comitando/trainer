import SwiftUI
import Combine
import AuthenticationInterface
import DependencyInjector

final class SignUpViewModel: ObservableObject {
    @Inject private var signUpUseCase: UserAccountInterface
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var gender: UserAccountGender = .male
    @Published var birthdate: Date = Date()
    @Published var isButtonDisabled: Bool = false
    @Published var stayLoggedIn: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
    weak var coordinator: AuthCoordinator?
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
        Publishers.CombineLatest($name, $email)
            .map { name, email in
                return !email.isEmpty && email.contains("@") && email.contains(".") && !name.isEmpty
            }
            .assign(to: \.isButtonDisabled, on: self)
            .store(in: &cancellables)
    }
    
    func createAccount() {
        let model = UserAccount(name: name, email: email, gender: gender, birthday: birthdate)
        do {
            try signUpUseCase.createAccount(model, keepLoggedIn: stayLoggedIn)
            print("Usuário criado com sucesso! Bem vindo, \(model.name)")
        } catch {
            print(error.localizedDescription)
        }
    }
}

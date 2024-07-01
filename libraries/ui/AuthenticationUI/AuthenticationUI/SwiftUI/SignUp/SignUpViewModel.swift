import SwiftUI
import Combine
import AuthenticationInterface

final class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var gender: UserAccountGender = .male
    @Published var birthdate: Date = Date()
    @Published var isButtonDisabled: Bool = false
    @Published var stayLoggedIn: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest($name, $email)
            .map { na
                return !email.isEmpty && email.contains("@") && email.contains(".") && !name.isEmpty
            }
            .assign(to: \.isButtonDisabled, on: self)
            .store(in: &cancellables)
    }
}

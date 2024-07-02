import SwiftUI
import DesignSystem
import DependencyInjector

struct Login: View {
    @StateObject private var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Manter logado?")
                Toggle("", isOn: $viewModel.stayLoggedIn).labelsHidden()
                    .tint(.colorFrom(dsColor: .primary))
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            TextField("Digite seu email", text: $viewModel.email)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            Button(action: {
                viewModel.makeLogin()
            }) {
                Text("Continuar")
                    .font(.fontFrom(font: .semiBold, size: 16))
                    .textCase(.uppercase)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(background())
                    .foregroundColor(foregroundColor())
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
            .disabled(!viewModel.isButtonDisabled)
        }
        .background(Color.colorFrom(dsColor: .neutralStronger).edgesIgnoringSafeArea(.all))
        .navigationTitle("Entrar")
    }
    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel) 
    }
    
    func background() -> Color? {
        return viewModel.isButtonDisabled ? Color.colorFrom(dsColor: .primary) : Color.colorFrom(dsColor: .neutralSoft)
    }
    
    func foregroundColor() -> Color? {
        return viewModel.isButtonDisabled ? Color.colorFrom(dsColor: .neutralStronger) : Color.colorFrom(dsColor: .neutralSoftest)
    }
    
}

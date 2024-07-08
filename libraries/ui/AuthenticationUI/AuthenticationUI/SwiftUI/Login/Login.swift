import SwiftUI
import DesignSystem
import DependencyInjector

struct Login: View {
    @StateObject private var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    Text("Manter logado?")
                    Toggle("", isOn: $viewModel.stayLoggedIn).labelsHidden()
                        .tint(.colorFrom(dsColor: .primary))
                }
                .padding(.horizontal)
                
                TextField("Digite seu email", text: $viewModel.email)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
            }
            .padding(10)
            .background(Color.colorFrom(dsColor: .neutralSoft))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            
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
        .background(
            Image.imageFrom(.fullscreenImage)!
                .resizable()
                .scaledToFill()
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
        )
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

import SwiftUI
import DesignSystem

struct IntroScreen: View {
    
    @State private var viewModel: IntroScreenInterface
    
    var body: some View {
        VStack {
            Spacer()
            Text("Trainer")
                .font(.fontFrom(font: .medium, size: 48))
                .foregroundColor(.colorFrom(dsColor: .neutralSoftest))
                .padding(.bottom)
            Spacer()
            VStack {
                Button(action: {
                    viewModel.showLogin()
                }) {
                    Text("Entrar")
                        .font(.fontFrom(font: .semiBold, size: 16))
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.colorFrom(dsColor: .neutralStronger))
                        .foregroundColor(.colorFrom(dsColor: .primary))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Button(action: {
                    viewModel.showCreateAccount()
                }) {
                    Text("Criar conta")
                        .font(.fontFrom(font: .semiBold, size: 16))
                        .textCase(.uppercase)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.colorFrom(dsColor: .primary))
                        .foregroundColor(.colorFrom(dsColor: .neutralStronger))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .background(Color.colorFrom(dsColor: .neutralStronger).edgesIgnoringSafeArea(.all))
    }
    
    init(viewModel: IntroScreenInterface) {
        self.viewModel = viewModel
    }
}

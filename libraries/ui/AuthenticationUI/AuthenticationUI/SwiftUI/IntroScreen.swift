import SwiftUI
import DesignSystem

struct IntroScreen: View {
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
                    // Ação para criar conta
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
                    // Ação para login
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
}

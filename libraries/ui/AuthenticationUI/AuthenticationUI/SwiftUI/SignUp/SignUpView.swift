import SwiftUI
import DesignSystem
import AuthenticationInterface

struct SignUpView: View {
    @StateObject private var viewModel: SignUpViewModel
    @State private var showingDatePicker = false
    
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
                
                TextField("Nome", text: $viewModel.name)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                HStack {
                    Text("Data de Nascimento")
                    Spacer()
                    Button(action: {
                        showingDatePicker.toggle()
                    }) {
                        Text("\(viewModel.birthdate, formatter: dateFormatter)")
                            .foregroundColor(Color.colorFrom(dsColor: .primary))
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                
                if showingDatePicker {
                    DatePicker(
                        "Data de Nascimento",
                        selection: $viewModel.birthdate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .tint(.colorFrom(dsColor: .primary))
                    .padding(.horizontal)
                }
                
                Picker("Sexo", selection: $viewModel.gender) {
                    ForEach(UserAccountGender.allCases) { gender in
                        Text(gender.rawValue.capitalized)
                            .tag(gender)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .background(Color.clear)
                            .onAppear {
                                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.colorFrom(color: .primary)
                            }
                    }
                )
            }
            .padding(10)
            .background(Color.colorFrom(dsColor: .neutralSoft))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            
            Button(action: {
                viewModel.createAccount()
            }) {
                Text("Criar conta")
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
        .navigationTitle("Criar conta")
    }
    
    init(viewModel: SignUpViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    func background() -> Color? {
        return viewModel.isButtonDisabled ? Color.colorFrom(dsColor: .primary) : Color.colorFrom(dsColor: .neutralSoft)
    }
    
    func foregroundColor() -> Color? {
        return viewModel.isButtonDisabled ? Color.colorFrom(dsColor: .neutralStronger) : Color.colorFrom(dsColor: .neutralSoftest)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

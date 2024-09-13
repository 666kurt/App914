import SwiftUI

struct CompatibilityScreen: View {
    
    @EnvironmentObject private var viewModel: CompatibilityModelView
    @State private var showCompatibilityResult = false
    
    var body: some View {
        VStack(spacing: 44) {
            Text("Calculating compatibility")
                .foregroundColor(.theme.text.textWhite)
                .font(.title2.weight(.bold))
            
            if viewModel.currentStep == 1 {
                VStack(spacing: 14) {
                    // Ввод данных мужчины
                    TextFieldView(text: $viewModel.firstPersonName, placeholder: "Enter man name")
                    RegisterDatePickerView(selection: $viewModel.firstPersonDate, title: "Enter date", component: .date)
                    RegisterDatePickerView(selection: $viewModel.firstPersonTime, title: "Enter time", component: .hourAndMinute)
                    TextFieldView(text: $viewModel.firstPersonPlace, placeholder: "Enter man place")
                    
//                    Spacer()
                    
                    Button {
                        print("sdfsdf")
                        // Переход к следующему шагу (ввод данных женщины)
                        viewModel.currentStep += 1
                    } label: {
                        Text("Save")
                            .padding(.vertical, 17)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .font(.callout.weight(.semibold))
                            .opacity(isDisable ? 1.0 : 0.5)
                    }.disabled(!isDisable)
                }
            } else if viewModel.currentStep == 2 {
                VStack(spacing: 14) {
                    // Ввод данных женщины
                    TextFieldView(text: $viewModel.secondPersonName, placeholder: "Enter woman name")
                    RegisterDatePickerView(selection: $viewModel.secondPersonDate, title: "Enter date", component: .date)
                    RegisterDatePickerView(selection: $viewModel.secondPersonTime, title: "Enter time", component: .hourAndMinute)
                    TextFieldView(text: $viewModel.secondPersonPlace, placeholder: "Enter woman place")
                    
                    Button {
                        // Переход на экран результата
                        showCompatibilityResult = true
                    } label: {
                        Text("Save")
                            .padding(.vertical, 17)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                            .font(.callout.weight(.semibold))
                            .opacity(isDisable ? 1.0 : 0.5)
                    }.disabled(!isDisable)
                    .fullScreenCover(isPresented: $showCompatibilityResult) {
                        // Переход на экран с результатами
                        CompatibilityResultScreen()
                            .environmentObject(viewModel)
                    }
                }
            }
        }
        .vstackModifier()
        .onAppear() {
            viewModel.resetData()
        }
    }
    
    private var isDisable: Bool {
        if viewModel.currentStep == 1 {
            return !viewModel.firstPersonName.isEmpty && !viewModel.firstPersonPlace.isEmpty
        } else {
            return !viewModel.secondPersonName.isEmpty && !viewModel.secondPersonPlace.isEmpty
        }
    }
}

#Preview {
    MainView()
        .environmentObject(CompatibilityModelView())
}

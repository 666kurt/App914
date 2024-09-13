import SwiftUI


// MARK: body
struct RegisterScreen: View {
    @ObservedObject var viewModel = RegisterViewModel()
    
    var body: some View {
        if viewModel.isFirstLaunch {
            ZStack {
                if viewModel.currentStep == 1 {
                    nameView
                } else if viewModel.currentStep == 2 {
                    dayOfBirthView
                } else if viewModel.currentStep == 3 {
                    timeOfBirthView
                } else if viewModel.currentStep == 4 {
                    placeOfBirthView
                }
            }
            .vstackModifier()
        } else {
            MainView()
        }
    }
}

// MARK: views
extension RegisterScreen {
    private var nameView: some View {
        VStack(spacing: 50) {
            RegisterTitleView(title: "Your name")
            RegisterImageView(image: "constellation")
            TextFieldView(text: $viewModel.name, placeholder: "Enter name")
            Spacer()
            Button {
                viewModel.saveName()
            } label: {
                RegisterButtonTextView()
            }
        }
    }
    
    private var dayOfBirthView: some View {
        VStack(spacing: 50) {
            RegisterTitleView(title: "Your date of birth")
            RegisterImageView(image: "calendar")
            
            RegisterDatePickerView(selection: $viewModel.birthDate,
                                   title: "Select date",
                                   component: .date)
            
            Spacer()
            Button {
                viewModel.saveBirthDate()
            } label: {
                RegisterButtonTextView()
            }
        }
    }
    
    private var timeOfBirthView: some View {
        VStack(spacing: 50) {
            RegisterTitleView(title: "Time of birth")
            RegisterImageView(image: "clock")
            
            RegisterDatePickerView(selection: $viewModel.birthTime,
                                   title: "Select time",
                                   component: .hourAndMinute)
            
            Spacer()
            Button {
                viewModel.saveBirthTime()
            } label: {
                RegisterButtonTextView()
            }
        }
    }
    
    private var placeOfBirthView: some View {
        VStack(spacing: 50) {
            RegisterTitleView(title: "Place of birth")
            RegisterImageView(image: "planet")
            TextFieldView(text: $viewModel.birthPlace, placeholder: "Enter place")
            Spacer()
            Button {
                viewModel.saveBirthPlace()
            } label: {
                RegisterButtonTextView()
            }
        }
    }
}

#Preview {
    RegisterScreen()
}

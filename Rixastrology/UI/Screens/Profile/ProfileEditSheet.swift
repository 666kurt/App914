import SwiftUI

struct ProfileEditSheet: View {
    
    @EnvironmentObject private var viewModel: RegisterViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(spacing: 15) {
            TextFieldView(text: $viewModel.savedName, placeholder: "")
            RegisterDatePickerView(selection: $viewModel.birthDate,
                                   title: "Change date",
                                   component: .date)
            RegisterDatePickerView(selection: $viewModel.birthTime, 
                                   title: "Change time",
                                   component: .hourAndMinute)
            TextFieldView(text: $viewModel.savedBirthPlace, placeholder: "")
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .padding(.vertical, 17)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                    .font(.callout.weight(.semibold))
            }

        }
        .vstackModifier()
    }
}

#Preview {
    ProfileEditSheet()
        .environmentObject(RegisterViewModel())
}

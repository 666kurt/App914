import SwiftUI

struct RegisterDatePickerView: View {
    
    @Binding var selection: Date
    let title: String
    let component: DatePicker.Components
    
    var body: some View {
        DatePicker(title,
                   selection: $selection,
                   displayedComponents: component)
            .padding()
            .datePickerStyle(.compact)
            .background(Color.theme.background.bgSecond)
            .font(.headline)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .colorScheme(.dark)
    }
}

#Preview {
    RegisterDatePickerView(selection: .constant(Date()),
                           title: "Select date",
                           component: .hourAndMinute)
}

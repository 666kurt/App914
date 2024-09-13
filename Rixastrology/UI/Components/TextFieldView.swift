import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(17)
            .background(Color.theme.background.bgSecond)
            .font(.title)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.theme.text.textBlue,
                                      lineWidth: 1), alignment: .center)
            .autocorrectionDisabled()
    }
}

#Preview {
    TextFieldView(text: .constant(""), placeholder: "Enter name")
}

import SwiftUI

struct RegisterButtonTextView: View {
    var body: some View {
        Text("Save")
            .padding(.vertical, 17)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.black)
            .clipShape(Capsule())
            .font(.callout.weight(.semibold))
    }
}

#Preview {
    RegisterButtonTextView()
}

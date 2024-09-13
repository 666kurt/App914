import SwiftUI

struct RegisterTitleView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.white)
    }
}

#Preview {
    RegisterTitleView(title: "Your name")
}

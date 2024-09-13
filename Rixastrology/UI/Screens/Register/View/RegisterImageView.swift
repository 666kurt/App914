import SwiftUI

struct RegisterImageView: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 228, height: 228)
            .scaledToFit()
    }
}

#Preview {
    RegisterImageView(image: "constellation")
}

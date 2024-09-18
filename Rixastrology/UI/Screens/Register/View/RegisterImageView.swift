import SwiftUI

struct RegisterImageView: View {
    
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: UIScreen.main.bounds.width * 0.5,
                   height: UIScreen.main.bounds.width * 0.5)
            .scaledToFit()
    }
}

#Preview {
    RegisterImageView(image: "constellation")
}

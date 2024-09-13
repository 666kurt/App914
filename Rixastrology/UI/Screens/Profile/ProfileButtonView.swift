import SwiftUI

struct ProfileButtonView: View {
    
    let image: String
    let title: String
    let url: String
    
    var body: some View {
        
        Link(destination: URL(string: url)!, label: {
            HStack(spacing: 10) {
                Image(systemName: image)
                Text(title)

                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(15)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.2))
            .clipShape(Capsule())
            .foregroundColor(.accentColor)
            .font(.system(size: 17, weight: .semibold))
        })
    }
}

#Preview {
    ProfileButtonView(image: "message.fill",
                      title: "Contact us",
                      url: "https://google.com")
        .vstackModifier()
}

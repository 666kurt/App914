import SwiftUI

struct TabBarItem: View {
    
    let image: String
    let title: String
    var screen: Screens
    @Binding var selectedScreen: Screens
    
    var body: some View {
        
        VStack(spacing: 4) {
            Image(systemName: image)
                .font(.system(size: 24))
            Text(title)
                .font(.caption)
        }
        .foregroundColor(selectedScreen == screen
                         ? .accentColor
                         : Color.white.opacity(0.5))
        .onTapGesture {
            selectedScreen = screen
        }
    }
}

#Preview {
    TabBarItem(image: "house.fill",
               title: "Home",
               screen: .home,
               selectedScreen: .constant(.home))
}

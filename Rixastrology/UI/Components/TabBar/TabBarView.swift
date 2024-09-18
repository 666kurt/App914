import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedScreen: Screens
    
    var body: some View {
        HStack {

            Spacer()
            
            TabBarItem(image: "house.fill",
                       title: "Home",
                       screen: .home,
                       selectedScreen: $selectedScreen)
            Spacer()
            
            TabBarItem(image: "wand.and.stars",
                       title: "Map",
                       screen: .map,
                       selectedScreen: $selectedScreen)
            
            Spacer()
            
            TabBarItem(image: "heart.fill",
                       title: "Compatibility",
                       screen: .compatibility,
                       selectedScreen: $selectedScreen)
            
            Spacer()
            
            TabBarItem(image: "person.fill",
                       title: "Profile",
                       screen: .profile,
                       selectedScreen: $selectedScreen)
            
            Spacer()

        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color(hex: "#414885"))
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.theme.text.textBlue,
                                  lineWidth: 1), alignment: .center)
        .padding(.horizontal)
    }
}

#Preview {
    TabBarView(selectedScreen: .constant(.home))
        .vstackModifier()
}

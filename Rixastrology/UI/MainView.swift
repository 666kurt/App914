import SwiftUI

struct MainView: View {
    
    @StateObject var router = Router.shared
    @StateObject private var registerViewModel = RegisterViewModel()
    @StateObject private var astroViewModel = AstroDataViewModel()
    @StateObject private var compatibilityModelViewViewModel = CompatibilityModelView()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                switch router.selectedScreen {
                case .home:
                    HomeScreen()
                case .map:
                    MapScreen()
                        .environmentObject(astroViewModel)
                case .compatibility:
                    CompatibilityScreen()
                        .environmentObject(compatibilityModelViewViewModel)
                case .profile:
                    ProfileScreen()
                }
                
                TabBarView(selectedScreen: $router.selectedScreen)
            }
            .environmentObject(registerViewModel)
            .environmentObject(router)
        }
    }
    
}
#Preview {
    MainView()
}

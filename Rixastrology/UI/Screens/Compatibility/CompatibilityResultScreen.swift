import SwiftUI

struct CompatibilityResultScreen: View {
    
    @EnvironmentObject var viewModel: CompatibilityModelView
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 60) {
            Text("The results are being\ncalculated")
                .foregroundColor(.theme.text.textWhite)
                .font(.title2.weight(.bold))
                .multilineTextAlignment(.center)
            
            ZStack {
                Image("result")
                    .resizable()
                    .scaledToFit()
                
                Text("\(viewModel.getCompatibility())%")
                    .font(.title3.weight(.semibold))
                    .foregroundColor(.white)
                    .offset(y: 5)
            }
            
            Button {
                router.selectedScreen = .home
            } label: {
                Text("Go home")
                    .padding(.vertical, 17)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                    .font(.callout.weight(.semibold))
            }
                
        }
        .vstackModifier()
    }
}

#Preview {
    CompatibilityResultScreen()
        .environmentObject(CompatibilityModelView())
        .environmentObject(Router.shared)
}

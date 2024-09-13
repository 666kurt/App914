import SwiftUI

struct ProfileScreen: View {
    
    @EnvironmentObject private var viewModel: RegisterViewModel
    
    var body: some View {
        VStack(spacing: 25) {
            Image("profile")
            
            Text("\(viewModel.savedName), \(viewModel.parsedBirthDate.formattedDate()), \(viewModel.parsedBirthTime.formattedTime()), \(viewModel.savedBirthPlace)")
                .font(.body.weight(.semibold))
                .foregroundColor(.theme.text.textWhite)
                .multilineTextAlignment(.leading)
            
            VStack(spacing: 9) {
                ProfileButtonView(image: "message.fill",
                                  title: "Contact us",
                                  url: "https://google.com")
                ProfileButtonView(image: "list.bullet.clipboard.fill",
                                  title: "Terms of use",
                                  url: "https://google.com")
                ProfileButtonView(image: "shield.fill",
                                  title: "Privacy",
                                  url: "https://google.com")
            }
        }
        .vstackModifier()
    }
}

#Preview {
    ProfileScreen()
        .environmentObject(RegisterViewModel())
}

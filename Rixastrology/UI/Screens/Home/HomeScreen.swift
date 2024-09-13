import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            let zodiacSign = viewModel.getZodiacSign(for: viewModel.parsedBirthDate)
            
            if let description = viewModel.zodiacDescriptions[zodiacSign] {
                
                HStack(spacing: 0) {
                    Text("Your zodiac sign is ")
                        .foregroundColor(.white)
                    Text(zodiacSign)
                        .foregroundColor(.theme.text.textBlue)
                }
                .font(.title2.weight(.bold))

                
                Image(zodiacSign)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 274, height: 274)
                    .padding(.bottom, 20)
                
                Text("Description of the solar sign")
                    .foregroundColor(.theme.text.textBlue)
                    .font(.title2.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                
                Spacer()
                
            } else {
                Text("Unknown Zodiac Sign")
            }
        }
        .vstackModifier()
    }
}

#Preview {
//    HomeScreen()
//        .environmentObject(RegisterViewModel())
    MainView()
}

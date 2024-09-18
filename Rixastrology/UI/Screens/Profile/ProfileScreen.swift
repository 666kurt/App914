import SwiftUI

struct ProfileScreen: View {
    
    @EnvironmentObject private var viewModel: RegisterViewModel
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
            Image("profile")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.5,
                       height: UIScreen.main.bounds.width * 0.5)
            
            HStack {
                Text("\(viewModel.savedName), \(viewModel.parsedBirthDate.formattedDate()), \(viewModel.parsedBirthTime.formattedTime()), \(viewModel.savedBirthPlace)")
                    .font(.body.weight(.semibold))
                    .foregroundColor(.theme.text.textWhite)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer()
                
                Button {
                    showSheet.toggle()
                } label: {
                    Image(systemName: "pencil")
                        .font(.title2)
                }
            }
            
            VStack(spacing: 9) {
                ProfileButtonView(image: "message.fill",
                                  title: "Contact us",
                                  url: "https://www.termsfeed.com/live/50d9788d-002b-4345-a0ee-d3c61f8f3ca6")
                ProfileButtonView(image: "list.bullet.clipboard.fill",
                                  title: "Terms of use",
                                  url: "https://www.termsfeed.com/live/b456ebce-ae4a-4c4c-a85a-46160624a701")
                ProfileButtonView(image: "shield.fill",
                                  title: "Privacy",
                                  url: "https://www.termsfeed.com/live/50d9788d-002b-4345-a0ee-d3c61f8f3ca6")
            }
        }
        .vstackModifier()
        .sheet(isPresented: $showSheet, content: {
            ProfileEditSheet()
        })
    }
}

#Preview {
    ProfileScreen()
        .environmentObject(RegisterViewModel())
}

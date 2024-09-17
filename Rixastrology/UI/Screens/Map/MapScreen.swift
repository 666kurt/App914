import SwiftUI

struct MapScreen: View {
    
    @EnvironmentObject private var viewModel: RegisterViewModel
    @EnvironmentObject private var astroViewModel: AstroDataViewModel
    
    var body: some View {
        VStack(spacing: 26) {
            titleView
            userInfoView
            natalChartView
            astroDataList
        }
        .vstackModifier()
    }
}

extension MapScreen {
    
    private var titleView: some View {
        Text("Your natal chart")
            .foregroundColor(.theme.text.textWhite)
            .font(.title2.weight(.bold))
    }
    
    private var userInfoView: some View {
        Text("\(viewModel.savedName), \(viewModel.parsedBirthDate.formattedDate()), \(viewModel.parsedBirthTime.formattedTime()), \(viewModel.savedBirthPlace)")
            .font(.body.weight(.semibold))
            .foregroundColor(.theme.text.textWhite)
            .multilineTextAlignment(.leading)
    }
    
    private var natalChartView: some View {
        Image(viewModel.randomNatalChartImage())
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
    }
    
    private var astroDataList: some View {
        ScrollView {
            Text("Key information")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body.weight(.semibold))
                .foregroundColor(.white)
                .padding(.bottom, 14)
            
            LazyVStack(spacing: 10) {
                let randomData = astroViewModel.getRandomThreeObjects()
                
                ForEach(randomData, id: \.self) { astro in
                    NavigationLink {
                        AstroDetailView(astro: astro)
                    } label: {
                        AstroCardView(astro: astro)
                    }
                }
            }
            .padding(.bottom, 30)
            
            Text("Planets")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body.weight(.semibold))
                .foregroundColor(.white)
                .padding(.bottom, 14)
            
            LazyVStack(spacing: 10) {
                let randomData = astroViewModel.getRandomSixObjects()
                
                ForEach(randomData, id: \.self) { astro in
                    NavigationLink {
                        AstroDetailView(astro: astro)
                    } label: {
                        AstroCardView(astro: astro)
                    }
                }
            }
            
        }
        .padding(.bottom, 90)
    }
}

#Preview {
    MainView()
}

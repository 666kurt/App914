import SwiftUI

struct AstroDetailView: View {
    
    let astro: AstroData
    
    var body: some View {
        VStack(spacing: 26) {
            Text(astro.title)
                .font(.title2.weight(.bold))
                .foregroundColor(.white)
            Text(astro.description)
                .font(.body)
                .foregroundColor(.white)
        }
        .vstackModifier()
    }
}

#Preview {
    AstroDetailView(astro: AstroData.previewData)
}

import SwiftUI

struct AstroCardView: View {
    
    let astro: AstroData
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(astro.title)
                    .font(.footnote.weight(.semibold))
                Text(astro.heading)
                    .font(.caption2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 17, weight: .semibold))
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 25)
        .foregroundColor(.black)
        .background(Color.theme.text.textWhite)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    AstroCardView(astro: AstroData.previewData)
        .vstackModifier()
}

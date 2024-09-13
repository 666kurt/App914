import SwiftUI

struct VStackModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal)
            .padding(.top, 50)
            .background(Image("backgroundImage")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill(), alignment: .center)
    }
}

extension View {
    func vstackModifier() -> some View {
        self.modifier(VStackModifiers())
    }
}

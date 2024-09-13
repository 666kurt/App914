import Foundation
import SwiftUI

enum Screens: String, Identifiable {
    case home
    case map
    case compatibility
    case profile
    
    var id: String {
        self.rawValue
    }
}


final class Router: ObservableObject {
    
    static let shared = Router()
    private init() {}
    
    @Published var selectedScreen: Screens = .home

}

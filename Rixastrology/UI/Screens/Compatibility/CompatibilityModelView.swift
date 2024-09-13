import Foundation

final class CompatibilityModelView: ObservableObject {
    
    @Published var currentStep = 1
    
    @Published var firstPersonName: String = ""
    @Published var firstPersonDate: Date = Date()
    @Published var firstPersonTime: Date = Date()
    @Published var firstPersonPlace: String = ""
    
    @Published var secondPersonName: String = ""
    @Published var secondPersonDate: Date = Date()
    @Published var secondPersonTime: Date = Date()
    @Published var secondPersonPlace: String = ""
    
    func getCompatibility() -> Int {
        return Int.random(in: 1...100)
    }
    
    func resetData() {
        currentStep = 1
        firstPersonName = ""
        firstPersonDate = Date()
        firstPersonTime = Date()
        firstPersonPlace = ""
        secondPersonName = ""
        secondPersonDate = Date()
        secondPersonTime = Date()
        secondPersonPlace = ""
    }
    
}

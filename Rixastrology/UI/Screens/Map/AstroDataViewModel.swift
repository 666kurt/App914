import Foundation
import SwiftUI

class AstroDataViewModel: ObservableObject {
    @Published var astroDataArray: [AstroData] = []
    
    init() {
        loadAstroDataFromFile()
    }
    
    func loadAstroDataFromFile() {
        if let url = Bundle.main.url(forResource: "astroData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                astroDataArray = try decoder.decode([AstroData].self, from: data)
                print("Data successfully loaded from file!")
            } catch {
                print("Error loading data from file: \(error)")
            }
        } else {
            print("File not found!")
        }
    }
    
    func getRandomThreeObjects() -> [AstroData] {
        guard astroDataArray.count >= 3 else {
            print("Not enough data to return three objects")
            return []
        }
        
        let shuffledData = astroDataArray.shuffled()
        return Array(shuffledData.prefix(3))
    }
    
    func getRandomSixObjects() -> [AstroData] {
        guard astroDataArray.count >= 6 else {
            print("Not enough data to return three objects")
            return []
        }
        
        let shuffledData = astroDataArray.shuffled()
        return Array(shuffledData.prefix(6))
    }
}

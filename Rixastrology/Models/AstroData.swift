import Foundation

struct AstroData: Codable, Hashable {
    let title: String
    let heading: String
    let description: String
    
    static var previewData: AstroData {
        AstroData(title: "Mercury in Gemini in the 3rd House",
                  heading: "Communication and Learning Style",
                  description: "Individuals with Mercury in Gemini in the 3rd house are natural communicators. They are quick-witted, curious, and love exchanging ideas. They thrive on learning and are constantly seeking new information. Their minds are agile, making them excellent multitaskers. However, this same agility can lead them to jump from one topic to another without diving deep. They value freedom in their thinking and enjoy socializing. Their challenge is to focus and organize their thoughts for greater clarity and depth in communication.")
    }
}

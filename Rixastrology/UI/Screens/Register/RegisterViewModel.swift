import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var currentStep: Int = 1
    @Published var name: String = ""
    @Published var birthDate: Date = Date()
    @Published var birthTime: Date = Date()
    @Published var birthPlace: String = ""
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @AppStorage("savedName") var savedName: String = ""
    @AppStorage("savedBirthDate") var savedBirthDateString: String = ""
    @AppStorage("savedBirthTime") var savedBirthTimeString: String = ""
    @AppStorage("savedBirthPlace") var savedBirthPlace: String = ""
    @AppStorage("savedNatalChart") var savedNatalChart: String = ""
    
    func saveName() {
        if !name.isEmpty {
            savedName = name
            currentStep += 1
        }
    }
    
    func saveBirthDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        savedBirthDateString = dateFormatter.string(from: birthDate)
        currentStep += 1
    }
    
    func saveBirthTime() {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        savedBirthTimeString = timeFormatter.string(from: birthTime)
        currentStep += 1
    }
    
    func saveBirthPlace() {
        if !birthPlace.isEmpty {
            savedBirthPlace = birthPlace
            isFirstLaunch = false
        }
    }
    
    var parsedBirthDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: savedBirthDateString) ?? Date()
    }
    
    var parsedBirthTime: Date {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter.date(from: savedBirthTimeString) ?? Date()
    }
    
    func getZodiacSign(for birthDate: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day], from: birthDate)
        let day = components.day!
        let month = components.month!
        
        switch (month, day) {
        case (1, 20...31), (2, 1...18): return "Aquarius"
        case (2, 19...29), (3, 1...20): return "Pisces"
        case (3, 21...31), (4, 1...19): return "Aries"
        case (4, 20...30), (5, 1...20): return "Taurus"
        case (5, 21...31), (6, 1...20): return "Gemini"
        case (6, 21...30), (7, 1...22): return "Cancer"
        case (7, 23...31), (8, 1...22): return "Leo"
        case (8, 23...31), (9, 1...22): return "Virgo"
        case (9, 23...30), (10, 1...22): return "Libra"
        case (10, 23...31), (11, 1...21): return "Scorpio"
        case (11, 22...30), (12, 1...21): return "Sagittarius"
        case (12, 22...31), (1, 1...19): return "Capricorn"
        default: return "Unknown"
        }
    }
    
    func randomNatalChartImage() -> String {
        if !savedNatalChart.isEmpty {
            return savedNatalChart
        } else {
            let natalCharts = ["natalChart1", "natalChart2", "natalChart3", "natalChart4", "natalChart5", "natalChart6", "natalChart7", "natalChart8", "natalChart9", "natalChart10"]
            let selectedChart = natalCharts.randomElement() ?? "natalChart1"
            savedNatalChart = selectedChart
            return selectedChart
        }
    }
    
    let zodiacDescriptions: [String: String] = [
        "Aquarius": "Aquarius is the sign of independence, intellect, and humanitarian ideals. Those born under Aquarius value freedom and strive to bring innovative solutions to the world. Known for their progressive mindset, Aquarians are natural visionaries, often ahead of their time.",
        "Pisces": "Pisces are intuitive, sensitive individuals known for their emotional depth and introspective nature. With their rich imagination, they are often drawn to creative and spiritual pursuits. Pisces possess a strong sense of empathy, often feeling the emotions of those around them, making them natural healers and compassionate companions.",
        "Aries": "Aries is a sign of energy, confidence, and leadership. Those born under Aries are driven by a passion for life and a fearless approach to challenges. They are trailblazers, always ready to take the initiative and face risks head-on.",
        "Taurus": "Taurus is known for their appreciation of stability and comfort. People born under this sign are hardworking, patient, and persistent, with a deep connection to the material world. Taureans have a strong aesthetic sense and often enjoy indulging in life’s pleasures, from good food to beautiful surroundings.",
        "Gemini": "Gemini is characterized by curiosity, intelligence, and adaptability. Geminis are quick thinkers who thrive on communication and love learning new things. Their versatility allows them to handle various situations with ease, making them excellent conversationalists and engaging companions.",
        "Cancer": "Cancer is a sign deeply connected to emotions, family, and intuition. Those born under Cancer are nurturing, protective, and value their close relationships above all. They have a natural ability to sense the needs and feelings of others, often acting as caretakers.",
        "Leo": "Leo is the sign of charisma, confidence, and leadership. Leos are naturally inclined to take center stage, and they thrive in the spotlight. With a strong will and a generous heart, they inspire others with their boldness and creativity.",
        "Virgo": "Virgo is a sign known for its analytical mind, attention to detail, and practicality. Virgos are meticulous and hardworking, always striving for perfection in everything they do. They have a keen eye for organization and order, making them experts at solving problems efficiently.",
        "Libra": "Libra is the sign of harmony, balance, and justice. Librans are diplomatic and strive for peace and fairness in all their relationships. They have a natural ability to see both sides of any situation, making them excellent mediators. Libras are also known for their appreciation of beauty and art, often seeking to create and surround themselves with aesthetically pleasing environments.",
        "Scorpio": "Scorpio is a sign of intensity, passion, and deep emotional insight. Scorpios are known for their powerful intuition and their ability to understand the hidden truths of others. They are driven by their inner desires and possess a magnetic presence that draws people toward them.",
        "Sagittarius": "Sagittarius is the sign of optimism, adventure, and the pursuit of knowledge. Sagittarians are free spirits who love to explore the world, both physically and intellectually. They are constantly seeking new experiences, whether through travel or learning, and their enthusiasm for life is contagious.",
        "Capricorn": "Capricorn is known for their sense of responsibility, discipline, and ambition. Capricorns are hard-working and methodical in their approach to achieving their goals, often displaying great patience and perseverance. They are natural leaders with a strong sense of duty, and they strive for success in all areas of life."
    ]
}

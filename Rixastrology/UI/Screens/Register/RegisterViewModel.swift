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
        "Aquarius": "Aquarius (Водолей) — это знак независимости, интеллекта и гуманитарных идей. Люди, рожденные под этим знаком, любят свободу и стремятся к новаторским решениям.",
        "Pisces": "Pisces (Рыбы) — интуитивные и чувствительные люди, склонные к глубокому самоанализу. Они творческие и обладают богатым воображением.",
        "Aries": "Aries (Овен) — это энергичные и уверенные в себе лидеры, обладающие решимостью и страстью к жизни. Они готовы к новым вызовам и рискам.",
        "Taurus": "Taurus (Телец) — люди, рожденные под этим знаком, ценят стабильность и комфорт. Они упорны и трудолюбивы, с любовью к прекрасному.",
        "Gemini": "Gemini (Близнецы) — это любопытные и умные личности, которые быстро адаптируются к новым ситуациям и любят общение.",
        "Cancer": "Cancer (Рак) — это чувствительные и заботливые люди, которые ценят семейные связи и обладают сильной интуицией.",
        "Leo": "Leo (Лев) — это яркие и харизматичные личности, которые любят быть в центре внимания. Львы уверены в себе и обладают сильной волей.",
        "Virgo": "Virgo (Дева) — это люди, склонные к анализу и перфекционизму. Они практичны и внимательны к деталям, всегда стремятся к порядку.",
        "Libra": "Libra (Весы) — это знак гармонии и справедливости. Люди под этим знаком ценят баланс и стремятся к миру и гармонии в отношениях.",
        "Scorpio": "Scorpio (Скорпион) — это страстные и целеустремленные личности, которые обладают сильной интуицией и умением глубоко понимать других.",
        "Sagittarius": "Sagittarius (Стрелец) — это оптимистичные и авантюрные люди, которые любят путешествия и всегда стремятся к новым знаниям.",
        "Capricorn": "Capricorn (Козерог) — это ответственные и дисциплинированные личности, которые всегда стремятся к своим целям через труд и настойчивость."
    ]
}

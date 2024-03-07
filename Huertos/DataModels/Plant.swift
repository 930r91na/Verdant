import Foundation
import SwiftUI


struct Plant {
    var scientificName: String
    var commonName: String
    var alias: String
    var recommendedSoil: SoilType
    var waterLevel: WaterLevel
    var sunlightLevel: SunlightLevel
    var difficulty: Difficulty
    var needsSupport: Bool
    var inorout: Inout?
    var image: Image
    var benefits: String?
    var ph: (Double, Double)?
    var temp: (Double, Double)?
    var sunHoursPerDay: (Double,Double)?
    var recommendedVarieties: String?
    var description: String?
    
}

struct Tree {
    var commonName: String
    var scientificName: String
    var alias: String
    var recommendedSoil: SoilType
    var waterLevel: WaterLevel
    var sunlightLevel: SunlightLevel
    var difficulty: Difficulty
}

struct MyPlant{
    var myPlant : Plant
    var dayOfCreation: Date
    var myPlantActivity: [PlantActivity]
    
}

struct PlantActivity: Identifiable {
    var id = UUID()
    var date: Date
    var watered: Bool
    var sunExposure: Bool
    var dayImage: Image?
}

var Tomato = Plant(
    scientificName: "Solanum lycopersicum",
    commonName: "Tomato",
    alias: "Cherry Bomb",
    recommendedSoil: .normal(percentage: 70),
    waterLevel: .high,
    sunlightLevel: .fullSun,
    difficulty: .moderate,
    needsSupport: true,
    inorout: .outdoor,
    image: Image("tomatoimage"),
    benefits: "Source of Potassium, Calcium, Sodium, Dietary fibre and Protein",
    ph: (5,7),
    temp: (10, 15),
    sunHoursPerDay: (6, 8),
    description: "A tomato is a nutrient-dense superfood that offers benefit to a range of bodily systems. Its nutritional content supports healthful skin, weight loss, and heart health"
)

let Potato = Plant(
    scientificName: "Solanum tuberosum",
    commonName: "Potato",
    alias: "Yukon Gold",
    recommendedSoil: .normal(percentage: 60),
    waterLevel: .medium,
    sunlightLevel: .fullSun,
    difficulty: .easy,
    needsSupport: false,
    inorout: .outdoor,
    image: Image("potatoimage"), // Ensure you have an image named "potatoimage" in your assets
    benefits: "Rich in vitamins C and B6, potassium, and fiber.",
    ph: (4.8, 5.5),
    temp: (5, 10),
    sunHoursPerDay: (5, 7),
    description: "A versatile root vegetable high in starch and fiber."
)

// Create a library (array) of plants
var plantLibrary: [Plant] = [Tomato, Potato]


func generateTomatoActivities(start: Date) -> [PlantActivity] {
    var activities = [PlantActivity]()
    let calendar = Calendar.current

    // Generate one activity per day for the last 30 days
    for day in 0..<30 {
        if let activityDate = calendar.date(byAdding: .day, value: day, to: start) {
            let watered = (day % 5 == 0)
            let sunExposure = true
            
            let activity = PlantActivity(
                date: activityDate,
                watered: watered,
                sunExposure: sunExposure,
                dayImage: Image(systemName: "dailypic") // Placeholder image, replace with actual day image if available
            )
            
            activities.append(activity)
        }
    }

    return activities
}

var myTomato = MyPlant(
    myPlant: Tomato,
    dayOfCreation:  Date() - 30 * 24 * 60 * 60,
    myPlantActivity: generateTomatoActivities(start: Date() - 30 * 24 * 60 * 60)
)

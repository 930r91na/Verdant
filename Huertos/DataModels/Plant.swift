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
    inorout: .outdoor
)

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

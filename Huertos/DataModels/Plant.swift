import Foundation
import SwiftUI


struct Plant: Identifiable{
    var id = UUID()
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
    var stagesInfo: [PlantStage]?
}

enum StageMode: String{
    case Current = "Current"
    case UpNext = "Up Next"
    case Completed = "Completed"
}

enum Stages: String{
    case sprout = "Sprout"
    case seedling = "Seedling"
    case vegetative = "Vegetative"
    case flowering = "Flowering"
    case ripening = "Ripening"
}

struct PlantStage: Identifiable {
    let id = UUID() 
    var stageName: Stages
    var duration: String
    var description: String
    var waterRequirement: String
    var sunlightRequirement: (Double,Double)
    var soilComposition: String
    var volume: Double
    var recommendedGardenType: GardenSetting
    var drainingRequirement: Bool
    var temperatureRange: (Double, Double)?
    var rootDepth: Double
    var spacing: Double
    var image: Image
    var notes: String
    var stageMode: StageMode
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

let tomatoStages: [PlantStage] = [
    PlantStage(
        stageName: .sprout,
        duration: "6 to 8 days",
        description: "Green sprout appears above soil.",
        waterRequirement: "Keep soil consistently moist but not waterlogged.",
        sunlightRequirement: (0, 0), // Sun not required until sprout appears.
        soilComposition: "Soil (70%) Humus (30%)",
        volume: 0.5,
        recommendedGardenType: .pot,
        drainingRequirement: true,
        temperatureRange: (18, 30),
        rootDepth: 25,
        spacing: 10,
        image: Image("sprout"),
        notes: "Indirect gardening; soil should be kept moist.",
        stageMode: .Current
    ),
    PlantStage(
        stageName: .seedling,
        duration: "25 to 35 days",
        description: "Development of true leaves and roots.",
        waterRequirement: "Water when the soil surface feels dry.",
        sunlightRequirement: (14, 18),
        soilComposition: "Soil (70%) Humus (30%)",
        volume: 0.5,
        recommendedGardenType: .pot,
        drainingRequirement: true,
        temperatureRange: (18, 21), // No max temp provided
        rootDepth: 25,
        spacing: 10,
        image: Image("seedling"),
        notes: "Begin with more sunlight exposure.",
        stageMode: .UpNext
    ),
    PlantStage(
        stageName: .vegetative,
        duration: "20 to 25 days",
        description: "Vines lengthen, foliage and roots grow, flowers start to emerge.",
        waterRequirement: "Water when the soil surface feels dry.",
        sunlightRequirement: (6, 8),
        soilComposition: "Soil (70%) Humus (30%)",
        volume: 20.0,
        recommendedGardenType: .raisedBed,
        drainingRequirement: true,
        temperatureRange: (18, 21),
        rootDepth: 25,
        spacing: 30,
        image: Image("vegetative"),
        notes: "Start staking as vines lengthen.",
        stageMode: .UpNext
    ),
    PlantStage(
        stageName: .flowering,
        duration: "20 to 30 days",
        description: "Yellow flowers appear and open. Support required as the plant will reach 30 to 45 cm in height.",
        waterRequirement: "Water when the soil surface feels dry.",
        sunlightRequirement: (6, 8),
        soilComposition: "Soil (70%) Humus (30%)",
        volume: 20.0,
        recommendedGardenType: .raisedBed,
        drainingRequirement: true,
        temperatureRange: (12, 30),
        rootDepth: 100,
        spacing: 30,
        image: Image("flowering"),
        notes: "Install cages or stakes for support.",
        stageMode: .UpNext
    ),
    PlantStage(
        stageName: .ripening,
        duration: "35 to 50 days",
        description: "Small green fruits appear, grow, and red color develops.",
        waterRequirement: "Water when the soil surface feels dry.",
        sunlightRequirement: (6, 8),
        soilComposition: "Soil (70%) Humus (30%)",
        volume: 20.0,
        recommendedGardenType: .raisedBed,
        drainingRequirement: true,
        temperatureRange: (12, 30),
        rootDepth: 100,
        spacing: 30,
        image: Image("ripening"),
        notes: "Monitor for ripeness, ready to harvest when fruits are fully colored.",
        stageMode: .UpNext
    )


]


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
    description: "A tomato is a nutrient-dense superfood that offers benefit to a range of bodily systems. Its nutritional content supports healthful skin, weight loss, and heart health",
    stagesInfo: tomatoStages
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

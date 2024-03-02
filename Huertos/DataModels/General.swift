import Foundation
import SwiftUI

enum SoilType {
    case normal(percentage: Int)
    case compost(percentage: Int)
    case wormHummus(percentage: Int)
}

enum SunlightLevel {
    case fullSun
    case partialShade
    case fullShade
}

enum WaterLevel {
    case high
    case medium
    case low
}

enum Difficulty {
    case easy
    case moderate
    case hard
}

enum GardenSetting {
    case pot
    case hydroponicSystem
    case raisedBed
}

enum Inout{
    case indoor
    case outdoor
}

// Dummy data generation function
func generateExampleUsers() -> [User] {
    // Detailed plant and tree information
    let plants = [
        Plant(scientificName: "Phaseolus vulgaris", commonName: "Frijol", alias: "Bean Stalker", recommendedSoil: .normal(percentage: 50), waterLevel: .low, sunlightLevel: .fullSun, difficulty: .easy, needsSupport: true),
        Plant(scientificName: "Solanum tuberosum", commonName: "Papa", alias: "Spud Buddy", recommendedSoil: .compost(percentage: 50), waterLevel: .medium, sunlightLevel: .partialShade, difficulty: .moderate, needsSupport: false),
        Plant(scientificName: "Solanum lycopersicum", commonName: "Jitomate", alias: "Red Gem", recommendedSoil: .compost(percentage: 40), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .moderate, needsSupport: true),
        Plant(scientificName: "Allium fistulosum", commonName: "Cebollita Cambray", alias: "Green Spear", recommendedSoil: .wormHummus(percentage: 60), waterLevel: .low, sunlightLevel: .partialShade, difficulty: .easy, needsSupport: false),
        Plant(scientificName: "Opuntia ficus-indica", commonName: "Nopal", alias: "Desert's Pride", recommendedSoil: .normal(percentage: 30), waterLevel: .low, sunlightLevel: .fullSun, difficulty: .easy, needsSupport: false),
        Plant(scientificName: "Daucus carota subsp. sativus", commonName: "Zanahoria", alias: "Orange Crunch", recommendedSoil: .compost(percentage: 50), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .moderate, needsSupport: false),
        Plant(scientificName: "Beta vulgaris", commonName: "Betabel", alias: "Ground Ruby", recommendedSoil: .wormHummus(percentage: 50), waterLevel: .medium, sunlightLevel: .partialShade, difficulty: .hard, needsSupport: false)
    ]

    let trees = [
        Tree(commonName: "Aguacate", scientificName: "Persea americana", recommendedSoil: .wormHummus(percentage: 75), waterLevel: .high, sunlightLevel: .fullSun, difficulty: .hard),
           Tree(commonName: "Limón", scientificName: "Citrus × limon", recommendedSoil: .normal(percentage: 50), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .easy),
           Tree(commonName: "Naranja", scientificName: "Citrus × sinensis", recommendedSoil: .normal(percentage: 60), waterLevel: .high, sunlightLevel: .fullSun, difficulty: .moderate),
           Tree(commonName: "Mandarina", scientificName: "Citrus reticulata", recommendedSoil: .compost(percentage: 40), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .moderate)
    ]

    var users: [User] = []

    // Generating users, gardens, and assigning plants and trees
    for userIndex in 1...3 {
        var gardens: [Garden] = []

        for gardenIndex in 1...5 {
            gardens.append(
                Garden(
                    id: UUID(),
                    name: "Garden \(gardenIndex)",
                    gardenpic: Image("garden1"),
                    description: "This is a lush garden located in User \(userIndex)'s backyard, showcasing a variety of plants and trees.",
                    location: "User \(userIndex)'s backyard",
                    numberOfPlants: plants.count + trees.count,
                    plants: plants,
                    trees: trees,
                    soilType: .compost(percentage: 50),
                    sunlightLevel: .fullSun,
                    setting: .pot
                )
            )
        }

        users.append(User(id: UUID(), username: "user\(userIndex)", age: 20 + userIndex, profilePicture: Image(systemName: "person.fill") , fullName: "User \(userIndex) Full Name", email: "email\(userIndex)@example.com", bio: "I love gardening and spending time outdoors.", location: "City \(userIndex)", gardens: gardens))
    }

    return users
}

let exampleUsers = generateExampleUsers()


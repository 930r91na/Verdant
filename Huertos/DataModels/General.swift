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
    let plantsData = [
        Plant(scientificName: "Phaseolus vulgaris", commonName: "Bean", alias: "Bean Stalker", recommendedSoil: .normal(percentage: 50), waterLevel: .low, sunlightLevel: .fullSun, difficulty: .easy, needsSupport: true, image: Image("beanimage")),
        Plant(scientificName: "Solanum tuberosum", commonName: "potato", alias: "Spud Buddy", recommendedSoil: .compost(percentage: 50), waterLevel: .medium, sunlightLevel: .partialShade, difficulty: .moderate, needsSupport: false, image: Image("potatoimage")),
        Plant(scientificName: "Solanum lycopersicum", commonName: "Tomato", alias: "Red Gem", recommendedSoil: .compost(percentage: 40), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .moderate, needsSupport: true, image: Image("tomatoimage")),
        Plant(scientificName: "Allium fistulosum", commonName: "Cambray onion", alias: "Green Spear", recommendedSoil: .wormHummus(percentage: 60), waterLevel: .low, sunlightLevel: .partialShade, difficulty: .easy, needsSupport: false, image: Image("onionimage")),
        Plant(scientificName: "Opuntia ficus-indica", commonName: "Prickly pear", alias: "Desert's Pride", recommendedSoil: .normal(percentage: 30), waterLevel: .low, sunlightLevel: .fullSun, difficulty: .easy, needsSupport: false, image: Image("pearimage")),
        Plant(scientificName: "Daucus carota subsp. sativus", commonName: "Carrot", alias: "Orange Crunch", recommendedSoil: .compost(percentage: 50), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .moderate, needsSupport: false, image: Image("tomatoimage")),
        Plant(scientificName: "Beta vulgaris", commonName: "Betabel", alias: "Beetroot", recommendedSoil: .wormHummus(percentage: 50), waterLevel: .medium, sunlightLevel: .partialShade, difficulty: .hard, needsSupport: false, image: Image("betabelimage"))
    ]
    
    let myPlants = plantsData.map { plant -> MyPlant in
            let activities = [PlantActivity(date: Date(), watered: true, sunExposure: true, dayImage: nil)] // Example activities
            return MyPlant(myPlant: plant, dayOfCreation: Date(), myPlantActivity: activities)
        }

    let trees = [
        Tree(commonName: "Aguacate", scientificName: "Persea americana", alias: "Cate de mi cora", recommendedSoil: .wormHummus(percentage: 75), waterLevel: .high, sunlightLevel: .fullSun, difficulty: .hard),
           Tree(commonName: "Limón", scientificName: "Citrus × limon", alias: "Mr Lemon",  recommendedSoil: .normal(percentage: 50), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .easy),
           Tree(commonName: "Naranja", scientificName: "Citrus × sinensis", alias: "Nara Manja",  recommendedSoil: .normal(percentage: 60), waterLevel: .high, sunlightLevel: .fullSun, difficulty: .moderate),
           Tree(commonName: "Mandarina", scientificName: "Citrus reticulata", alias: "Manda la nana",  recommendedSoil: .compost(percentage: 40), waterLevel: .medium, sunlightLevel: .fullSun, difficulty: .moderate)
    ]
    
    let names = [ "Megan", "Ana Lau", "Ivan" ]
    let fullNames = [ "Megan Montiel", "Ana Mandujano", "Ivan Nicolas"]
    let bios = ["I love chicken and tulips",
                "I love making bread and cooking",
                "I love making music, sometimes"]
    let descriptions = [
        "A serene oasis filled with exotic flowers and a tranquil pond.",
        "A vibrant vegetable garden boasting a variety of seasonal produce.",
        "A cottage garden with winding paths, fragrant herbs, and colorful perennials.",
        "A modern rooftop garden featuring sleek design and urban greenery."
    ]


    var users: [User] = []

    // Generating users, gardens, and assigning plants and trees
    for userIndex in 0...2 {
        var gardens: [Garden] = []

        let numberOfGardens = Int.random(in: 2...4)
        for gardenIndex in 1...numberOfGardens {
            // Select a random subset of plants and trees for each garden
            let selectedPlants = myPlants.shuffled().prefix(Int.random(in: 3...5))
            let selectedTrees = trees.shuffled().prefix(Int.random(in: 2...4))

            // Aquí usamos el módulo para ciclar a través de las descripciones
            let descriptionIndex = (gardenIndex - 1) % descriptions.count

            gardens.append(
                Garden(
                    id: UUID(),
                    name: "Garden \(gardenIndex)",
                    gardenpic: Image("garden\(gardenIndex)"), // Asegúrate de que estas imágenes existen
                    description: descriptions[descriptionIndex],
                    location: "\(names[userIndex])'s backyard",
                    numberOfPlants: selectedPlants.count + selectedTrees.count,
                    plants: Array(selectedPlants),
                    trees: Array(selectedTrees),
                    soilType: .compost(percentage: 50),
                    sunlightLevel: .fullSun,
                    setting: .pot
                )
            }
            
            users.append(User(id: UUID(), username: usersInfo[index].name, age: 20 + index, profilePicture: Image("profilePic\(index)"), fullName: userInfo.name, email: userInfo.email, bio: userInfo.bio, location: "Puebla", gardens: gardens))
        }

        return users
}

let exampleUsers = generateExampleUsers()


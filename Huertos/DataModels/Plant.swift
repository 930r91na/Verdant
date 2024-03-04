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

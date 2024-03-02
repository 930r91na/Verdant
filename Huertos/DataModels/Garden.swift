import Foundation
import SwiftUI


struct Garden {
    var id: UUID
    var name: String
    var gardenpic: Image
    var description: String
    var location: String
    var numberOfPlants: Int
    var plants: [Plant]
    var trees: [Tree]
    var soilType: SoilType
    var sunlightLevel: SunlightLevel
    var setting: GardenSetting
}

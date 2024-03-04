import SwiftUI

struct PlantView: View {
    var plant: Plant
    
    var body: some View {
        ScrollView{
            Text("Plant view")
        }
        .navigationTitle(plant.alias)
    }
}

/*
#Preview {
    PlantView()
}
*/

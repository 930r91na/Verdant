import SwiftUI

struct PlantView: View {
    @State private var showingDetail = false
    var plant: Plant

    var body: some View {
        ScrollView {
            Button("Show Plant Details") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                PlantDetailView(plant: plant)
            }
        }
        .navigationTitle(plant.alias)
    }
}

struct PlantDetailView: View {
    var plant: Plant

    var body: some View {
        VStack {
            Image(systemName: "leaf.circle") // Suponiendo que usas un SF Symbol como icono
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            Text(plant.commonName)
                .font(.title)
            
            ScrollView {
                Text("Description")
                    .padding()
            }
        }
    }
}



struct PlantView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleGarden = generateExampleUsers().first?.gardens.first
        
        if let plant = exampleGarden?.plants[0] {
            PlantView(plant: plant)
        } else {
            Text("No plant available")
        }
    }
}

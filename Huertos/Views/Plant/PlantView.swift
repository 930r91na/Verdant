import SwiftUI

struct PlantView: View {
    @State private var showingDetail = false
    var plant: Plant

    var body: some View {
        VStack {
            Button("Show plant information") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                PlantInformationView(plant: plant)
            }
            
            HStack{
                Text("[Plant image]")
            }
            .frame(maxWidth: .infinity, maxHeight: 220)
            
            ScrollView{
                HStack{
                    Text("Scroll HStack")
                }
                .frame(maxWidth: .infinity, maxHeight: 230)
            }
            .background(Color.green)
        }
        .navigationTitle(plant.alias)
        .accentColor(.primaryGreen)
        .background(Color.white)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct PlantInformationView: View {
    var plant: Plant

    var body: some View {
        VStack {
            Image(systemName: "leaf.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.primaryGreen)
            
            Text(plant.commonName)
                .font(.title)
            
            Text("General description")
            // TODO: Call the info description of the plant view
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cream.edgesIgnoringSafeArea(.all)) // Usa Color.cream para el fondo
        .accentColor(.primaryGreen)
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

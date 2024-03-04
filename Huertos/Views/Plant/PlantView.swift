import SwiftUI

struct PlantView: View {
    @State private var showingDetail = false
    @State private var selectedDate = Date()
    var plant: Plant

    var body: some View {
        VStack {
            HStack{
                Image(systemName: "leaf")
                    .font(Font.custom("SF Pro Display", size: 80).weight(.bold))
                    .foregroundColor(Color.primaryGreen)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            Button("Show plant information") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                PlantInformationView(plant: plant)
            }
            
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        VStack {
                            DatePicker("Seleccionar fecha", selection: $selectedDate, displayedComponents: .date)
                                            .datePickerStyle(GraphicalDatePickerStyle()) // Estilo gráfico para el selector de fecha
                                            .padding()
                            // .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                        }
                    }
                    .background(Color.cream)
                    .clipShape(RoundedTopCorners(radius: 20))
                    .overlay(
                        RoundedTopCorners(radius: 20)
                            .stroke(Color.primaryGreen, lineWidth: 3)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.horizontal)
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        .navigationTitle(plant.alias)
        .accentColor(.primaryGreen)
        .background(Color.white)
    }
}

struct RoundedTopCorners: Shape {
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))
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

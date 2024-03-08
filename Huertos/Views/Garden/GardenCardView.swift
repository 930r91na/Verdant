import SwiftUI

struct GardenCardView: View {
    @State private var navigateToGardenView = false
    var garden: Garden // Parámetro para los datos del jardín
    @State private var selectedGarden: Garden? // Para la navegación

    var body: some View {
        ZStack {
            // Imagen de fondo del jardín
            garden.gardenpic
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 351, height: 165)
                .cornerRadius(12)
                .clipped()

            // Gradiente sobre la imagen de fondo
            LinearGradient(
                stops: [
                    .init(color: Color(red: 0.38, green: 0.42, blue: 0.22).opacity(0.5), location: 0.00),
                    .init(color: Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0.5), location: 1.00),
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(width: 351, height: 165)
            .cornerRadius(12)
            
            // Contenido de la tarjeta
            Button(action: {
                self.selectedGarden = garden
                navigateToGardenView = true
            }) {
                VStack(alignment: .leading, spacing: 5) {
                    Spacer()
                    Text(garden.name) // Nombre del jardín
                        .font(Font.custom("SF Pro Display", size: 20).weight(.bold))
                        .foregroundColor(.white)

                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                        Text(garden.location) // Ubicación del jardín
                            .foregroundColor(.white)
                    }

                    HStack {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.white)
                        Text("\(garden.numberOfPlants) total plants") // Número total de plantas
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            .frame(width: 351, height: 165)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 16, x: 0, y: 0)
        }
        .frame(width: 351, height: 165, alignment: .leading)
        .background(NavigationLink(destination: GeneralGardenView(garden: selectedGarden ?? garden), isActive: $navigateToGardenView) {
            EmptyView()
        })
    }
}

struct GardenCardView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleGarden = (generateExampleUsers().first?.gardens.first!)!
                GardenCardView(garden: exampleGarden)
    }
}


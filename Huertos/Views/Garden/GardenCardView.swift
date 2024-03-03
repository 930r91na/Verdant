import SwiftUI

struct GardenCardView: View {
    @State private var navigateToGardenView = false
    var garden: Garden // Parámetro para los datos del jardín

    var body: some View {
        ZStack {
            NavigationLink(destination: GardenView(), isActive: $navigateToGardenView) {
                EmptyView()
            }
            Button(action: {
                navigateToGardenView = true
            }) {
                HStack {
                    garden.gardenpic // Utiliza la imagen del jardín específico
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 137.5, height: 145)
                        .clipped()
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 16, x: 0, y: 0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 1)
                                .stroke(Color.primaryGreen, lineWidth: 2)
                        )
                        .padding(.trailing, 21)

                    VStack(alignment: .leading, spacing: 5) {
                        Text(garden.name) // Muestra el nombre del jardín
                            .font(Font.custom("SF Pro Display", size: 20).weight(.bold))
                            .foregroundColor(Color.primaryGreen)

                        HStack {
                            Image(systemName: "location.fill")
                                .font(Font.custom("SF Pro Display", size: 20).weight(.bold))
                                .foregroundColor(Color.primaryGreen)
                            
                            Text(garden.location) // Muestra la ubicación del jardín
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(Color.black)
                        }
                        
                        HStack {
                            Image(systemName: "leaf.fill")
                                .font(Font.custom("SF Pro Display", size: 20).weight(.bold))
                                .foregroundColor(Color.primaryGreen)
                            
                            Text("\(garden.numberOfPlants) total plants") // Muestra el número de plantas
                                .font(Font.custom("SF Pro Display", size: 16))
                                .foregroundColor(Color.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.primaryGreen)
                }
            }
            .padding(21)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 10)
            .padding(15)
        }
    }
}



struct GardenCardView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleGarden = (generateExampleUsers().first?.gardens.first!)!
                GardenCardView(garden: exampleGarden)
    }
}


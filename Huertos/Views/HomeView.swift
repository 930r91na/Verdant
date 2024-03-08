import SwiftUI

struct HomeView: View {
    @State private var isShowingNotification = false
    var name: String = "Megan"
    
    var body: some View {
        NavigationView {
            ScrollView{
                NavigationLink(destination: NotificationView(), isActive: $isShowingNotification) { EmptyView() }
                HStack {
                    VStack(alignment: .leading){
                        Text("Hello \(name),")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                        Text("Welcome back!")
                            .font(.title2)
                            .foregroundColor(.primaryGreen)
                    }
                    Spacer()
                }
                .padding()
                
                PlantOfTheDayView(plant: Tomato)
                
                .navigationTitle("Home")
                .navigationBarItems(trailing: Button(action: {
                    isShowingNotification = true
                }) {
                    Image(systemName: "bell.badge.fill")
                })
            }
        }
        .accentColor(Color.primaryGreen)
    }
}

struct PlantOfTheDayView: View {
    @State private var navigateToPlantView = false
    var plant: Plant // Parámetro para los datos de la planta
    @State private var selectedPlant: Plant? // Para la navegación

    var body: some View {
        Button(action: {
            self.selectedPlant = plant
            navigateToPlantView = true
        }) {
            ZStack {
                // Imagen de fondo de la planta
                plant.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 351, height: 165)
                    .clipped()
                    .cornerRadius(12)
                
                // Gradiente sobre la imagen de fondo
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(red: 0.38, green: 0.42, blue: 0.22).opacity(0.5), location: 0.00),
                        .init(color: Color(red: 0.4, green: 0.4, blue: 0.4).opacity(0.5), location: 1.00),
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(width: 351, height: 165)
                .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 5) {
                    Spacer()
                    Text(plant.commonName)
                        .fontWeight(.bold)
                        .font(.custom("SF Pro Display", size: 17))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(40)
                    
                    Spacer()
                    
                    Text(plant.scientificName)
                        .font(.custom("SF Pro Display", size: 15).weight(.bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(40)
                }
                .frame(width: 351, height: 165)
                .cornerRadius(12)
            }
        }
        .background(NavigationLink(destination: GeneralPlantView(plant : myTomato), isActive: $navigateToPlantView) {
            EmptyView()
        })
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 16, x: 0, y: 0)
        .frame(width: 351, height: 165, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

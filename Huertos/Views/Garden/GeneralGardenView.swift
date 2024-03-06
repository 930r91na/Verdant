import SwiftUI

struct GeneralGardenView: View {
    var garden: Garden
    
    var body: some View {
        ScrollView {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 393, height: 345)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: Color(red: 0.38, green: 0.42, blue: 0.22).opacity(0.1), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.97, green: 0.97, blue: 0.97).opacity(0.1), location: 0.83),
                    Gradient.Stop(color: .white, location: 1.00),
                  ],
                  startPoint: UnitPoint(x: 0.5, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              )
              .background(
                garden.gardenpic
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 393, height: 345)
                  .clipped()
              )
            
            VStack{
                HStack{
                    GardenTipsView(garden: garden)
                    GardenPlantsView(garden: garden)
                   
                }
                LogCardGardenView(garden : garden)
            }
            
            
        }
        .navigationTitle("\(garden.name)")
        .accentColor(.primaryGreen)
    }
}

struct GardenTipsView: View {
    var garden: Garden
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tips")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
            // Add more content here using garden data if necessary
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(.white.opacity(0.75))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 0)
        .padding(21)
    }
}

struct GardenPlantsView: View {
    var garden: Garden
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Plants")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Spacer()
            // Here you might list the plants, for example:
                Text("# \(garden.numberOfPlants) ")
                
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(.white.opacity(0.75))
        .cornerRadius(12)
        .padding(21)
        .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 0)
    }
}

struct LogCardGardenView: View {
    var garden: Garden

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Activity")
                    .font(.custom("SF Pro Display", size: 17).weight(.semibold))
                    .foregroundColor(.black)

                Spacer()

                Button("Dismiss") {
                    // Empty log
                }
                .foregroundColor(.primaryGreen)
                .padding()
                .background(Color.primaryGreen.opacity(0.15))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            
            // ScrollView should allow scrolling through all the logs
            ScrollView {
                // Optional unwrapping for myLog
                if let log = garden.myLog, !log.isEmpty {
                    // Using ForEach with unwrapped myLog
                    ForEach(log) { log in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(log.title)
                                    .italic()
                                    .foregroundColor(.primaryGreen)
                                
                                Spacer()
                                
                                // You should calculate the days from creation
                                // using the daysFromCreation property
                                Text("\(log.daysFromCreation) days ago")
                                    .font(.caption)
                                    .foregroundColor(.primaryGreen)
                            }
                            
                            Text(log.description)
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.top, 2)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryGreen.opacity(0.15))
                        .cornerRadius(12)
                        .shadow(radius: 4)
                    }
                } else {
                    // Show a message when there are no logs
                    Text("No activity yet")
                        .foregroundColor(.gray)
                        .italic()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                }
            }
            .padding(.horizontal)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 0)
        .padding(21)
    }
}


struct GeneralGardenView_Previews: PreviewProvider {
    static var previews: some View {
        // Generar usuarios y seleccionar un jardín de ejemplo
        let exampleGarden = generateExampleUsers().first?.gardens.first!
        
        // Pasar el jardín de ejemplo a GardenView
        GeneralGardenView(garden: exampleGarden!)
    }
}

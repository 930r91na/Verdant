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
                    //GardenTipsView()
                    LogCardGardenView(garden : garden)
                }
                
            }
            
            
        }
        .navigationTitle("\(garden.name)")
        .accentColor(.primaryGreen)
    }
}

struct GardenTipsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Tips")
                .font(Font.custom("SF Pro Display", size: 28).weight(.bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .top, spacing: 21) {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Color.primaryGreen)
                    .imageScale(.large)
                VStack(alignment: .leading, spacing: 5) {
                    // Here you can add actual tips content
                    Text("Watering Schedule")
                        .font(.headline)
                    Text("Make sure to water your plants according to their needs.")
                        .font(.subheadline)
                }
            }
            .padding(21)
            .frame(width: 393, alignment: .topLeading)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}

struct LogCardGardenView: View {
    var garden: Garden

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                Text("Activity")
                  .font(
                    Font.custom("SF Pro Display", size: 17)
                      .weight(.semibold)
                  )
                  .foregroundColor(.black)
                
              Spacer()
              
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 0)
        
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

import SwiftUI

struct PlantCardView: View {
    var plant: Plant

    @State private var navigateToPlantView = false
    
    var body: some View {
        Button(action: {
            navigateToPlantView = true
        }) {
            VStack {
                NavigationLink(destination: PlantView(plant: plant), isActive: $navigateToPlantView) { EmptyView() }
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.primaryGreen)
                    .padding(.top)

                Text(plant.alias)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black)
                
                Text(plant.commonName)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .padding(.bottom)
            }
            .frame(width: 100, height: 100)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 6)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


/*
struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        let plantExample: Plant
        
        PlantCardView(plant: plantExample)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
*/

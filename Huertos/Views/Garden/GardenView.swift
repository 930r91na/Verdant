import SwiftUI

struct GardenView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    AddPlantButtonView()
                    PlantCardView()
                    PlantCardView()
                }
                .padding(.bottom)
                
                HStack {
                    PlantCardView()
                    PlantCardView()
                    PlantCardView()
                }
            }
            .navigationTitle("Gardens")
        }
        .accentColor(Color.primaryGreen)
    }
}

struct AddPlantButtonView: View {
    @State private var navigateToNewPlantView = false
    
    var body: some View {
        NavigationLink(destination: NewPlantView(), isActive: $navigateToNewPlantView) { EmptyView() }
        
        Button(action: {
            navigateToNewPlantView = true
        }) {
            VStack {
                Image(systemName: "plus.app")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.primaryGreen)
                    .padding(.top)

                Text("Add")
                    .font(Font.custom("SF Pro Display", size: 20).weight(.bold))
                    .foregroundColor(.primaryGreen)
                
                Text("New plant")
                    .font(Font.custom("SF Pro Display", size: 15).weight(.bold))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom)
            }
        }
        .frame(width: 100, height: 100)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 8)
    }
}

#Preview {
    GardenView()
}

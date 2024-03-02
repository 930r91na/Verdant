import SwiftUI

struct GardenView: View {
    let plantNames = ["Sophia", "Julia", "John", "Peter"]

    var body: some View {
        NavigationView {
            ScrollView {
                let gridItems = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
                
                LazyVGrid(columns: gridItems, spacing: 20) {
                    AddPlantButtonView()
                    ForEach(plantNames, id: \.self) { name in
                        PlantCardView(name: name)
                    }
                }
            }
            .navigationTitle("Gardens")
        }
        .accentColor(.primaryGreen)
    }
}

struct AddPlantButtonView: View {
    @State private var navigateToNewPlantView = false
    
    var body: some View {
        Button(action: {
            navigateToNewPlantView = true
        }) {
            VStack {
                Image(systemName: "plus.app.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.primaryGreen)
                    .padding(.top)

                Text("Add")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.primaryGreen)
                
                Text("New plant")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom)
            }
            .frame(width: 100, height: 100)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 8)
        }
        .buttonStyle(PlainButtonStyle())
        .background(NavigationLink(destination: NewPlantView(), isActive: $navigateToNewPlantView) { EmptyView() })
    }
}

#Preview {
    GardenView()
}

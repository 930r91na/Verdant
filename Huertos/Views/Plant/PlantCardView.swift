import SwiftUI

struct PlantCardView: View {
    var name: String // Añadido parámetro 'name' para personalizar el nombre de la planta

    @State private var navigateToPlantView = false
    
    var body: some View {
        Button(action: {
            navigateToPlantView = true
        }) {
            VStack {
                NavigationLink(destination: PlantView(), isActive: $navigateToPlantView) { EmptyView() }
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.primaryGreen)
                    .padding(.top)

                Text(name) // Usando el nombre de la planta pasado como parámetro
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom)
            }
            .frame(width: 100, height: 100)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCardView(name: "Juan")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

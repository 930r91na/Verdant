import SwiftUI

struct PlantCardView: View {
    var alias: String
    var name: String

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

                Text(alias)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black)
                
                Text(name)
                    .font(.system(size: 12))
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
        PlantCardView(alias: "Juan", name: "Frijol")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

import SwiftUI

struct PlantCardView: View {
    @State private var navigateToPlantView = false
    
    var body: some View {
        NavigationLink(destination: PlantView(), isActive: $navigateToPlantView) { EmptyView() }
        
        Button(action: {
            navigateToPlantView = true
        }) {
            VStack {
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.primaryGreen)
                    .padding(.top)

                Text("Plant Name")
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

struct PlantCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantCardView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

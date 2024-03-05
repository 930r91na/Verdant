import SwiftUI

struct GeneralGardenView: View {
    var gardens: [Garden] // Asume que tienes los jardines del usuario 1 aquí

    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: -10) {
                    AddGardenButtonView()
                    ForEach(gardens, id: \.id) { garden in
                        GardenCardView(garden: garden)
                    }
                }
                .padding(.top, 15)
            }
            .navigationTitle("Gardens")
        }
        .accentColor(Color.primaryGreen)
    }
}


struct AddGardenButtonView: View {
    @State private var navigateToNewGardenView = false
    
    var body: some View {
        NavigationLink(destination: NewGardenView(), isActive: $navigateToNewGardenView) { EmptyView() }
        
        Button(action: {
            navigateToNewGardenView = true
        }) {
            HStack {
                Image(systemName: "plus.app")
                    .font(Font.custom("SF Pro Display", size: 35).weight(.bold))
                    .foregroundColor(Color.primaryGreen)
                    .padding(.leading, 10)
                
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Text("Add")
                        .font(Font.custom("SF Pro Display", size: 25).weight(.bold))
                        .foregroundColor(Color.primaryGreen)
                    
                    Text("New garden")
                        .font(Font.custom("SF Pro Display", size: 18).weight(.bold))
                        .foregroundColor(.black)
                }
                .padding(.leading, 10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 2)
        .padding(16)
    }
}

struct GeneralGardenView_Previews: PreviewProvider {
    static var previews: some View {
        // Generar usuarios de ejemplo y extraer jardines del primer usuario
        let exampleGardens = generateExampleUsers().first?.gardens ?? []
        GeneralGardenView(gardens: exampleGardens)
    }
}


import SwiftUI

struct CollectionGardenView: View {
    var gardens: [Garden]

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
    @State private var showingNewGardenView = false // Estado para controlar la presentación del sheet
    
    var body: some View {
        Button(action: {
            showingNewGardenView = true // Muestra NewGardenView cuando se hace clic
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
        .sheet(isPresented: $showingNewGardenView) { // Utiliza el modificador .sheet aquí
            NewGardenView()
        }
    }
}

struct CollectionGardenView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleGardens = generateExampleUsers().first?.gardens ?? []
        CollectionGardenView(gardens: exampleGardens)
    }
}

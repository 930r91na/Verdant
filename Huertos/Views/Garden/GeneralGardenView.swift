import SwiftUI

struct GeneralGardenView: View {
    @State private var isShowingNewGardenView = false
    // @State private var showAddGardenButtonView = false // No es necesario si siempre se muestra AddGardenButtonView

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    AddGardenButtonView()
                    GardenCardView()
                    GardenCardView()
                    GardenCardView()
                    GardenCardView()
                }
            }
            .navigationTitle("Gardens")
        }
        .accentColor(Color.primaryGreen)
    }
}

struct AddGardenButtonView: View {
    var body: some View {
        HStack {
            Image(systemName: "plus.app")
                .font(Font.custom("SF Pro Display", size: 40).weight(.bold))
                .foregroundColor(Color.primaryGreen)
                .padding(.leading, 10)
            
            Spacer()
            VStack(alignment: .trailing, spacing: 0) {
                Text("Add")
                    .font(Font.custom("SF Pro Display", size: 28).weight(.bold))
                    .foregroundColor(Color.primaryGreen)
                
                Text("New garden")
                    .font(Font.custom("SF Pro Display", size: 22).weight(.bold))
                    .foregroundColor(.black)
            }
            .padding(.leading, 10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 2)
        .padding(15)
        Spacer()
    }
}


struct GeneralGardenView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralGardenView()
    }
}

import SwiftUI

struct GeneralGardenView: View {
    @State private var isShowingNewGardenView = false
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
    @State private var navigateToNewGardenView = false
    
    var body: some View {
        NavigationLink(destination: NewGardenView(), isActive: $navigateToNewGardenView) { EmptyView() }
        
        Button(action: {
            navigateToNewGardenView = true
        }) {
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

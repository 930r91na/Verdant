import SwiftUI

/*
 struct AddGardenButtonView: View {
     @State private var navigateToNewGardenView = false
     
     var body: some View {
         NavigationLink(destination: NewGardenView(), isActive: $navigateToNewGardenView) { EmptyView() }
         
         Button(action: {
             navigateToNewGardenView = true
         }) {
             HStack {
 
 */

struct GardenCardView: View {
    @State private var navigateToGardenView = false
    
    var body: some View {
        NavigationLink(destination: GardenView(), isActive: $navigateToGardenView) { EmptyView() }
        
        Button(action: {
            navigateToGardenView = true
        }) {
            HStack {
                Image("PATH_TO_IMAGE") // Replace "PATH_TO_IMAGE" with your actual image path
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 137.5, height: 145)
                    .clipped()
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 16, x: 0, y: 0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 1)
                            .stroke(Color.primaryGreen, lineWidth: 2)
                    )
                    .padding(.trailing, 21) // This ensures space between the image and the text
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Garden Name")
                        .font(Font.custom("SF Pro Display", size: 22).weight(.bold))
                        .foregroundColor(Color.primaryGreen)
                    
                    HStack{
                        Image(systemName: "location.fill")
                            .font(Font.custom("SF Pro Display", size: 20).weight(.bold))
                            .foregroundColor(Color.primaryGreen)
                        
                        Text("Location")
                            .font(Font.custom("SF Pro Display", size: 16))
                    }
                    
                    HStack {
                        Image(systemName: "leaf.fill")
                            .font(Font.custom("SF Pro Display", size: 20).weight(.bold))
                            .foregroundColor(Color.primaryGreen)
                        
                        Text("18 total plants")
                            .font(Font.custom("SF Pro Display", size: 16))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Image(systemName: "chevron.right")
                    .foregroundColor(Color.primaryGreen)
                }
            }
        }
        .padding(21)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding(15)
    }
}

struct GardenCardView_Previews: PreviewProvider {
    static var previews: some View {
        GardenCardView()
            .previewLayout(.sizeThatFits)
    }
}

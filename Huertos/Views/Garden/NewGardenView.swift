import SwiftUI

struct NewGardenView: View {
    var body: some View {
        ScrollView{
            Text("New garden view")
            .navigationTitle("Adding new garden")
            .accentColor(Color.primaryGreen)
        }
        .navigationTitle("Adding new plant")
    }
}

#Preview {
    NewGardenView()
}

import SwiftUI

struct NewGardenView: View {
    var body: some View {
        NavigationView {
            Text("New garden view")
            .navigationTitle("Adding new garden")
        }
        .accentColor(Color.primaryGreen)
    }
}

#Preview {
    NewGardenView()
}

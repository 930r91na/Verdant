import SwiftUI

struct NewGardenView: View {
    var body: some View {
        Text("New garden view")
        .navigationTitle("Adding new garden")
        .accentColor(Color.primaryGreen)
    }
}

#Preview {
    NewGardenView()
}

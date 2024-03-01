import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home view")
                .navigationTitle("Home")
        }
        .accentColor(Color.primaryGreen)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

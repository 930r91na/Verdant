import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home view")
                .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

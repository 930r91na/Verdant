import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Text("Gardens view")
                .tabItem {
                    Image(systemName: "leaf.fill")
                    Text("Gardens")
                }
            
            Text("Home view")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("Profile view")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.green)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

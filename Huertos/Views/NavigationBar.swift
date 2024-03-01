import SwiftUI

struct NavigationBar: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            GeneralGardenView()
                .tabItem {
                    Image(systemName: "leaf.fill")
                    Text("Gardens")
                }
                .tag(0)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            
            // TODO: Change for the correct profile view
            LogInView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(Color.primaryGreen)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}



import SwiftUI

struct HomeView: View {
    @State private var isShowingNotification = false
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Text("Home view")
                    NavigationLink(destination: NotificationView(), isActive: $isShowingNotification) { EmptyView() }
                }
                .navigationTitle("Home")
                .navigationBarItems(trailing: Button(action: {
                    isShowingNotification = true
                }) {
                    Image(systemName: "bell.badge.fill")
                })
            }
        }
        .accentColor(Color.primaryGreen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

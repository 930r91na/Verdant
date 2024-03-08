import SwiftUI

struct HomeView: View {
    @State private var isShowingNotification = false
    var name: String = "Megan"
    
    var body: some View {
        NavigationView {
            ScrollView{
                NavigationLink(destination: NotificationView(), isActive: $isShowingNotification) { EmptyView() }
                HStack {
                    VStack(alignment: .leading){
                        Text("Hello \(name),")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                        Text("Welcome back!")
                            .font(.title2)
                            .foregroundColor(.primaryGreen)
                    }
                    Spacer()
                }
                .padding()
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

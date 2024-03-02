import SwiftUI

@main
struct HuertosApp: App {
    // Changing general appereance of standard components
    init(){
        let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.titleTextAttributes = [.foregroundColor: UIColor(Color.primaryGreen)]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.primaryGreen)]

                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
        }
    }
}

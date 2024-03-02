import SwiftUI

struct GeneralGardenView: View {
    @State private var isShowingNewGardenView = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: GardenView()) {
                    Text("Go to garden view")
                }
                // NavigationLink oculto que se activa por `isShowingNewGardenView`
                NavigationLink(destination: NewGarden(), isActive: $isShowingNewGardenView) { EmptyView() }
            }
            .navigationTitle("Gardens")
            .navigationBarItems(trailing: Button(action: {
                isShowingNewGardenView = true
            }) {
                Image(systemName: "plus")
            })
        }
        .accentColor(Color.primaryGreen)
    }
}

struct GeneralGardenView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralGardenView()
    }
}

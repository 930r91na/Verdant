import SwiftUI

struct NewGardenView: View {
    @State private var gardenName: String = ""
    @State private var selectedType: String = "Pot"
    @State private var location: String = "Indoors"
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var isUsingCurrentLocation: Bool = false
    @State private var expositionLevels: String = ""

    let types = ["Pot", "Raised Bed", "Hydroponic System"]
    let locations = ["Indoors", "Outdoors"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("My new garden's name will be...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                    TextField("Name", text: $gardenName)
                        .listRowBackground(Color.primaryGreen.opacity(0.15))
                }
                
                Section(header: Text("It will be a...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                    Picker("Type", selection: $selectedType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .listRowBackground(Color.primaryGreen.opacity(0.15))
                }
                
                Section(header: Text("It will be located...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                    Picker("Location", selection: $location) {
                        ForEach(locations, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .listRowBackground(Color.primaryGreen.opacity(0.15))
                }
                
                Section(header: Text("It has the following dimensions...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                    TextField("Length (cm)", text: $length)
                        .listRowBackground(Color.primaryGreen.opacity(0.15))
                    TextField("Width (cm)", text: $width)
                        .listRowBackground(Color.primaryGreen.opacity(0.15))
                    TextField("Depth (cm)", text: $depth)
                        .listRowBackground(Color.primaryGreen.opacity(0.15))
                }
                
                Section(header: Text("Its physical location will be at...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                    Toggle(isOn: $isUsingCurrentLocation) {
                        Text("Use maps to fetch current location")
                    }
                    .listRowBackground(Color.primaryGreen.opacity(0.15))
                }
                
                Section(header: Text("Its daily exposition levels are...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                    // This is a placeholder, replace with appropriate control for exposition levels
                    TextField("Exposition Levels", text: $expositionLevels)
                        .listRowBackground(Color.primaryGreen.opacity(0.15))
                }
            }
            .navigationTitle("Add new garden")
        }
    }
    
}

#Preview {
    NewGardenView()
}

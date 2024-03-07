import SwiftUI

struct NewPlantView: View {
    @State private var plantName: String = ""
    @State private var showPlantTypeSelector = false
    @State private var plantType: String = "Select type"
    @State private var growthStage: String = "Seed"
    var color = Color.primaryGreen.opacity(0.15)
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("My new plant's name will be...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                        TextField("Name", text: $plantName)
                            .listRowBackground(color)
                    }
                
                Section(header: Text("It will be a ...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                        Button(action: {
                            self.showPlantTypeSelector = true
                        }) {
                            HStack {
                                Text(plantType)
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 1)
                        }
                        .padding(.horizontal)
                        .sheet(isPresented: $showPlantTypeSelector) {
                            PlantTypeCarouselView(plantType: $plantType, plants: plantLibrary)
                        }
                        
                        TextField("Name", text: $plantName)
                            .listRowBackground(color)
                    }
                
                
                Section(header: Text("Its current growth stage ...")
                    .foregroundColor(.primaryGreen)
                    .font(Font.custom("SF Pro Display", size: 13))){
                        Picker("Type", selection: $plantType) {
                            /*
                             ForEach(types, id: \.self) {
                             Text($0)
                             }*/
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .listRowBackground(color)
                    }
                
                
                
                Section {
                    HStack {
                        Spacer()
                        Button("Add Plant") {
                            // Aquí puedes agregar la lógica para guardar el jardín
                            print("Garden added successfully")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.primaryGreen)
                        .cornerRadius(10)
                        Spacer()
                    }
                }
                
            }
            .scrollContentBackground(.hidden)
            
            
            .navigationTitle("Add new plant")
        }
    }
}

struct PlantTypeCarouselView: View {
    @Binding var plantType: String
    var plants: [Plant]

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(plants, id: \.scientificName) { plant in
                            PlantCardView(plant: plant)
                                .frame(width: 350, height: 500) // Adjusted for potentially better fit
                                .onTapGesture {
                                    self.plantType = plant.commonName // Sets the tapped plant as the selected type
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Button("Select Plant") {
                    print("Selected plant type: \(plantType)")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.primaryGreen)
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("Select Plant Type")
            .navigationBarItems(leading: Button(action: {
                            // Logic to present a view or action sheet to add a customized plant
                        }) {
                            Text("Add Customized Plant")
                                .foregroundColor(.primaryGreen) // Text color
                                .padding()
                                .cornerRadius(10)
                        })
        }
    }
}

struct NewPlantView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlantView()
    }
}

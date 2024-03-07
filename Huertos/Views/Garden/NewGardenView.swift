import SwiftUI
import MapKit

struct NewGardenView: View {
    @State private var gardenName: String = ""
    @State private var selectedType: String = "Pot"
    @State private var location: String = "Indoors"
    @State private var filtration: String = "Yes"
    @State private var length: String = ""
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var isUsingCurrentLocation: Bool = false
    @State private var expositionLevels: String = ""
    
    // Buttons
    @State private var showingLocationPicker = false
    @State private var showingInfoAlert = Array(repeating: false, count: 8)
    var color = Color.primaryGreen.opacity(0.15)

    let types = ["Pot", "Raised Bed", "Hydroponic System"]
    let locations = ["Indoors", "Outdoors"]
    let filtrations = ["Yes", "No"]

    var body: some View {
        NavigationView{
            Form {
                    Section(header:
                        HStack {
                        Text("My new garden's name will be...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[0] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Garden's name", isPresented: $showingInfoAlert[0]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("First question")
                            }
                            .textCase(nil)
                        })
                    {
                        TextField("Name", text: $gardenName)
                            .listRowBackground(color)
                    }
                    
                    Section(header:
                        HStack {
                            Text("It will be a...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[1] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Type of plant", isPresented: $showingInfoAlert[1]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("Second question")
                            }
                            .textCase(nil)

                        })
                    {
                        Picker("Type", selection: $selectedType) {
                            ForEach(types, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .listRowBackground(color)
                    }
                
                    Section(header:
                        HStack {
                        Text("It will be located...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[2] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Location", isPresented: $showingInfoAlert[2]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("Third question")
                            }
                            .textCase(nil)

                        })
                    {
                        Picker("Location", selection: $location) {
                            ForEach(locations, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .listRowBackground(Color.primaryGreen.opacity(0.15))
                    }
                
                    Section(header:
                        HStack {
                            Text("It has the following dimensions...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[3] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Dimensions", isPresented: $showingInfoAlert[3]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("Fourth question")
                            }
                            .textCase(nil)

                        })
                    {
                        TextField("Length (cm)", text: $length)
                            .keyboardType(.numberPad)
                            .listRowBackground(color)
                        TextField("Width (cm)", text: $width)
                            .keyboardType(.numberPad)
                            .listRowBackground(color)
                        TextField("Depth (cm)", text: $depth)
                            .keyboardType(.numberPad)
                            .listRowBackground(color)
                    }
                
                    Section(header:
                        HStack {
                            Text("Its geographical location will be at...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[4] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Geographical location", isPresented: $showingInfoAlert[4]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("Fifth question")
                            }
                            .textCase(nil)

                        })
                    {
                        Button(action: {
                            self.showingLocationPicker = true
                            }) {
                                Text("Select Location")
                            }
                            .foregroundColor(.primary)
                    }
                    
                    Section(header:
                        HStack {
                        Text("Its daily exposition levels are...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[5] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Daily exposition levels", isPresented: $showingInfoAlert[5]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("Sixth question")
                            }
                            .textCase(nil)

                        })
                    {
                        TextField("Hours per day", text: $length)
                            .keyboardType(.numberPad)
                            .listRowBackground(color)
                    }
                
                    Section(header:
                        HStack {
                        Text("Its soil composition (100% total)...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[6] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Soil composition", isPresented: $showingInfoAlert[6]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("Seventh question")
                            }
                            .textCase(nil)

                        })
                    {
                        TextField("% Normal soil", text: $length)
                            .keyboardType(.numberPad)
                            .listRowBackground(color)
                        TextField("% Compost", text: $width)
                            .keyboardType(.numberPad)
                            .listRowBackground(color)
                        TextField("% Hummus", text: $depth)
                            .keyboardType(.numberPad)
                            .listRowBackground(color)
                    }
                        
                    Section(header:
                        HStack {
                        Text("Filtration system...")
                                .foregroundColor(.primaryGreen)
                                .font(Font.custom("SF Pro Display", size: 13))
                        
                            Spacer()
                        
                            Button(action: {
                                showingInfoAlert[7] = true
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.primaryGreen)
                            }
                            .alert("Filtration system", isPresented: $showingInfoAlert[7]) {
                                Button("OK", role: .cancel) { }
                            }
                            message: {
                                Text("Eight question")
                            }
                            .textCase(nil)

                        })
                    {
                        Picker("Filtration system", selection: $filtration) {
                            ForEach(filtrations, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .listRowBackground(Color.primaryGreen.opacity(0.15))
                    }
                    
                    Section {
                        HStack {
                            Spacer()
                            Button("Add Garden") {
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
                .sheet(isPresented: $showingLocationPicker) {
                LocationPickerView()
            }
            .navigationTitle("Add new garden")
        }
    }
}

class IdentifiablePointAnnotation: NSObject, MKAnnotation, Identifiable {
    var id = UUID() // Cumple con Identifiable
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

struct LocationPickerView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 19.0433, longitude: -98.20),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var locations = [IdentifiablePointAnnotation]()

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapPin(coordinate: location.coordinate, tint: .blue)
        }
        .onAppear {
            let initialLocation = CLLocationCoordinate2D(latitude: 19.0433, longitude: -98.20)
            centerMap(on: initialLocation)
        }
        .gesture(
            LongPressGesture(minimumDuration: 0.5)
                .onEnded { _ in
                    let newLocation = IdentifiablePointAnnotation(coordinate: region.center)
                    locations.append(newLocation)
                }
        )
    }
    
    private func centerMap(on coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
}

struct LocationPickerView_Previews: PreviewProvider{
    static var previews: some View{
        NewGardenView()
    }
}

import SwiftUI

struct PlantActivity: Identifiable {
    var id = UUID()
    var date: Date
    var watered: Bool
    var sunExposure: Bool
    var dayImage: Image
}

struct DayBubble: View {
    var activity: PlantActivity?
    private let calendar = Calendar.current

    var body: some View {
        VStack {
            // Use optional chaining with a default value for the date
            Text(dayAbbreviation(activity?.date ?? Date()))
                .font(.caption)
                .padding(.top, 2) // Adjust spacing as needed

            ZStack {
                // Adjust the color based on the activity being nil or having specific values
                RoundedRectangle(cornerRadius: 40) // This makes it more of an oval shape
                    .foregroundColor((activity?.watered == true || activity?.sunExposure == true) ? .clear : Color.gray.opacity(0.2))
                    .frame(width: 70, height: 129) // Adjust size as needed

                HStack(spacing: 0) {
                    // Check each condition with optional chaining
                    if activity?.watered == true {
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: activity?.sunExposure == true ? 15 : 30, height: 30) // Half width if also sun exposed
                    }
                    if activity?.sunExposure == true {
                        Circle()
                            .foregroundColor(.yellow)
                            .frame(width: activity?.watered == true ? 15 : 30, height: 30) // Half width if also watered
                    }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray, lineWidth: 0)
            )
        }
        .onTapGesture {
            // Code to select this date and show details
        }
    }
    
    private func dayAbbreviation(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE" // Adjust if you want another format
        return dateFormatter.string(from: date)
    }
}


struct PlantView: View {
    @State private var showingDetail = false
    @State private var isShowingEdit = false
    @State private var selectedDate = Date()
    @State private var activities: [PlantActivity] = []
           
           private let calendar = Calendar.current
    var plant: Plant
    private var daysInMonth: [Date] {
            guard let monthInterval = calendar.dateInterval(of: .month, for: selectedDate) else {
                return []
            }
            return calendar.generateDays(for: monthInterval)
        }

    var body: some View {
        VStack {
            NavigationLink(destination: EditPlantView(), isActive: $isShowingEdit) { EmptyView() }
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Image(systemName: "leaf")
                            .font(Font.custom("SF Pro Display", size: 80).weight(.bold))
                            .foregroundColor(Color.primaryGreen)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .contentShape(Rectangle())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            
            
            Button("Show plant information") {
                showingDetail = true
            }
            .sheet(isPresented: $showingDetail) {
                PlantInformationView(plant: plant)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(daysInMonth, id: \.self) { date in
                        // Fetching the activity for the given date or providing a default
                        let activity = activities.first { calendar.isDate($0.date, inSameDayAs: date) }
                        
                        DayBubble(activity: activity)
                    }
                }
                .padding()
            }
            
            GeometryReader { geometry in
                VStack {
                    ScrollView {
                        /*
                        VStack {
                            DatePicker("Seleccionar fecha", selection: $selectedDate, displayedComponents: .date)
                                            .datePickerStyle(GraphicalDatePickerStyle()) // Estilo gráfico para el selector de fecha
                                            .padding()
                            // .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                        }*/
                    }
                    .background(Color.cream)
                    .clipShape(RoundedTopCorners(radius: 20))
                    .overlay(
                        RoundedTopCorners(radius: 20)
                            .stroke(Color.primaryGreen, lineWidth: 3)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarItems(trailing: Button(action: {
            isShowingEdit = true
        }) {
            Image(systemName: "pencil")
        })
        .navigationBarTitle(plant.alias, displayMode: .inline)
        .accentColor(.primaryGreen)
    }
}

struct RoundedTopCorners: Shape {
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct PlantInformationView: View {
    var plant: Plant

    var body: some View {
        VStack {
            Image(systemName: "leaf.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.primaryGreen)
            
            Text(plant.commonName)
                .font(.title)
            
            Text("General description")
            // TODO: Call the info description of the plant view
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cream.edgesIgnoringSafeArea(.all)) // Usa Color.cream para el fondo
        .accentColor(.primaryGreen)
    }
    private func formattedDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        
        private func dayAbbreviation(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE"
            return dateFormatter.string(from: date).uppercased()
        }
    
}


struct DayIndicator: View {
    var date: Date
    var isSelected: Bool
    @Binding var activities: [PlantActivity]
    private let calendar = Calendar.current
    
    var body: some View {
        let isWatered = activities.contains(where: { $0.date == date && $0.watered })
        let isSunExposed = activities.contains(where: { $0.date == date && $0.sunExposure })
        
        return Text(calendar.isDateInToday(date) ? "T" : String(calendar.component(.day, from: date)))
            .padding(8)
            .background(isSelected ? Color.blue : (isWatered || isSunExposed ? Color.green : Color.gray.opacity(0.3)))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: isSelected ? 2 : 0)
            )
            .onTapGesture {
                // Actions when tapping the day indicator
            }
    }
}

// Helper extension to generate days in a month
extension Calendar {
    func generateDays(for interval: DateInterval) -> [Date] {
        var days: [Date] = []
        var date = interval.start
        
        while date <= interval.end {
            days.append(date)
            date = self.date(byAdding: .day, value: 1, to: date)!
        }
        
        return days
    }
}

struct PlantView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleGarden = generateExampleUsers().first?.gardens.first
        
        if let plant = exampleGarden?.plants[0] {
            PlantView(plant: plant)
        } else {
            Text("No plant available")
        }
    }
}

import SwiftUI

struct GeneralPlantView: View {
    @State private var isShowingStage = false
    var plant: MyPlant
    
    var body: some View {
        ZStack(alignment: .top) {
            plant.myPlant.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 393, height: 345)
                .clipped()
            
            LinearGradient(
                stops: [
                    .init(color: Color(red: 0.38, green: 0.42, blue: 0.22).opacity(0.1), location: 0.00),
                    .init(color: Color(red: 0.97, green: 0.97, blue: 0.97).opacity(0.1), location: 0.83),
                    .init(color: .white, location: 1.00)
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .frame(width: 393, height: 345)
            ScrollView {
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 345 / 2)
                    
                    VStack {
                        GeneralEvolutionView(plant: plant.myPlant)
                    }
                    
                    VStack {
                        GeneralStagesView(plant: plant.myPlant)
                    }
                    .offset(y: 20)
                    
                }
            }
        }
        .navigationTitle("\(plant.myPlant.alias)")
        .frame(width: 393, alignment: .top)
        .accentColor(.primaryGreen)
        .sheet(isPresented: $isShowingStage) {
            
        }
    }
}

struct DayActivity: Identifiable {
    let id = UUID()
    var day: String // Puede ser una fecha o una representación de cadena del día
    var activities: [ActivityType]
    
    enum ActivityType {
        case water, fertilizer, image, sunExposure
    }
}

let weekActivities: [DayActivity] = [
    DayActivity(day: "Mon", activities: [.water]),
    DayActivity(day: "Tue", activities: [.fertilizer]),
    DayActivity(day: "Wed", activities: [.image, .water]),
    DayActivity(day: "Thu", activities: [.water]),
    DayActivity(day: "Fri", activities: [.fertilizer, .image, .sunExposure, .water]),
    DayActivity(day: "Sat", activities: [.image, .water]),
    DayActivity(day: "Sun", activities: [.water]),
]

struct CalendarView: View {
    var activities: [DayActivity]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 4), count: 2)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(activities) { dayActivity in
                    VStack{
                        Text(dayActivity.day)
                            .font(.caption)
                        HStack(alignment: .center){
                            LazyVGrid(columns: columns, spacing: 4) {
                                ForEach(dayActivity.activities, id: \.self) { activity in
                                    Circle()
                                        .fill(colorForActivity(activity))
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .padding(10)
                        }
                        .frame(width: 41, height: 50)
                        .background(Color.primaryGreen.opacity(0.15))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal, -5)
                }
            }
            .padding(.horizontal)
        }
    }
    
    func colorForActivity(_ activity: DayActivity.ActivityType) -> Color {
        switch activity {
            case .water: return Color.navyBlue
            case .fertilizer: return Color.lightGreen
            case .image: return Color.opaqueRed
            case .sunExposure: return Color.mustardYellow
        }
    }
}


struct GeneralEvolutionView: View {
    var plant: Plant
    
    var color = Color.primaryGreen.opacity(0.15)
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Evolution")
                    .font(.headline)
                    .foregroundColor(.black)
                
                HStack {
                    CalendarView(activities: weekActivities) // Asumiendo que tienes 'weekActivities' disponible
                }
                .padding(.bottom, 10)
                
                // Inserted Form Below
                Form {
                    Section(header: Text("REGISTER ACTIVITY")
                        .foregroundColor(.primaryGreen)
                        .font(Font.custom("SF Pro Display", size: 13))
                    ) {
                        HStack {
                            Text("Water")
                            Spacer()
                            Button(action: {
                                // Acciones para registrar la actividad de agua
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                        .listRowBackground(color)
                        
                        HStack {
                            Text("Fertilizer")
                            Spacer()
                            Button(action: {
                                // Acciones para registrar la actividad de fertilizante
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                        .listRowBackground(color)
                        
                        HStack {
                            Text("Image")
                            Spacer()
                            Button(action: {
                                // Acciones para añadir una imagen
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                        .listRowBackground(color)
                        
                        HStack {
                            Text("Sun Exposure")
                            Spacer()
                            Button(action: {
                                // Acciones para registrar la actividad de exposición al sol
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                        .listRowBackground(color)
                        
                    }
                }
                .scrollContentBackground(.hidden)
                .padding(-15)
                .frame(minHeight: 200)
            }
            .padding(16)
            .frame(width: 351, alignment: .topLeading)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.2), radius: 16, x: 0, y: 0)
        }
        .background(Color.clear)
    }
}


struct GeneralStagesView: View{
    var plant: Plant
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Stages")
                .font(.headline)
                .foregroundColor(.black)
            
            
            if let currentStages = plant.stagesInfo?.filter({ $0.stageMode == .Current }), !currentStages.isEmpty {
                Group {
                    Text("Current")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(.black)
                    
                    ForEach(currentStages) { stage in
                        StageMiniCardView(infoStage: stage)
                    }
                }
            }

            if let upNextStages = plant.stagesInfo?.filter({ $0.stageMode == .UpNext }), !upNextStages.isEmpty {
                Group {
                    Text("Up Next")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(.black)
                    
                    ForEach(upNextStages) { stage in
                        StageMiniCardView(infoStage: stage)
                    }
                }
            }

            
            if let completedStages = plant.stagesInfo?.filter({ $0.stageMode == .Completed }), !completedStages.isEmpty {
                Group {
                    Text("Completed")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(.black)
                    
                    ForEach(completedStages) { stage in
                        StageMiniCardView(infoStage: stage)
                    }
                }
            }
        }
        .padding(16)
        .frame(width: 351, alignment: .topLeading)
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 0)
    }
}

struct StageMiniCardView: View {
    var infoStage: PlantStage
    var body: some View{
        HStack(alignment: .center) {
            HStack(alignment: .center, spacing: 3) {
                Image(systemName: "play")
                    .font(Font.custom("SF Pro Display", size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Text(infoStage.stageName.rawValue)
                    .font(
                        Font.custom("SF Pro Display", size: 15)
                            .weight(.bold)
                    )
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(.white.opacity(0.15))
            .cornerRadius(40)
            Spacer()
            HStack(alignment: .center, spacing: 3) {
                Text(infoStage.duration)
                    .font(Font.custom("SF Pro Display", size: 10))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(.white.opacity(0.15))
            .cornerRadius(40)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .black.opacity(0.2), location: 0.00),
                    Gradient.Stop(color: .black.opacity(0.2), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
        .background(
            infoStage.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 319, height: 48)
                .clipped()
        )
        .cornerRadius(12)
    }
}


#Preview {
    GeneralPlantView(plant : myTomato)
}

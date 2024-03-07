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
                        /*
                         HStack {
                         Button(action: {
                         self.showingTipsSheet = true
                         }) {
                         GardenTipsView(garden: garden)
                         }
                         .sheet(isPresented: $showingTipsSheet) {
                         // Present your tips view here
                         }
                         
                         NavigationLink(destination: GardenView(garden: garden), isActive: $showingPlantsSheet) {
                         GardenPlantsView(garden: garden)
                         }
                         }
                         .padding(.horizontal, 21)
                         
                         LogCardGardenView(garden: garden)
                         .padding(.horizontal, 21)
                         */
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
                    Gradient.Stop(color: .white.opacity(0), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.76, green: 0.77, blue: 0.73).opacity(0.6), location: 1.00),
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

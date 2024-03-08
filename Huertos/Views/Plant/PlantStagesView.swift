import SwiftUI

struct PlantStageDetailView: View {
    var stage: PlantStage

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(stage.stageName.rawValue)
                    .font(.title)
                Image("tip")
                    .resizable()
                    .scaledToFit()
                Text("Duration: \(stage.duration)")
                Text("Description: \(stage.description)")
                Text("Water Requirement: \(stage.waterRequirement)")
                // Agrega más detalles según necesites mostrar
            }
            .padding()
        }
        .navigationBarTitle(Text(stage.stageName.rawValue), displayMode: .inline)
    }
}

struct PlantStagesView: View {
    let stages: [PlantStage]

    var body: some View {
        List(stages, id: \.id) { stage in
            NavigationLink(destination: PlantStageDetailView(stage: stage)) {
                Text(stage.stageName.rawValue)
            }
        }
        .navigationBarTitle("Tomato Stages", displayMode: .inline)
    }
}

struct TomatoStageDetailView: View {
    let stages = TomatoStagesData.tomatoStages

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(stages.enumerated()), id: \.element.id) { (index, stage) in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(stage.stageName.rawValue)
                            .font(.headline)
                        
                        Text("Duration: \(stage.duration)")
                        Text("Description: \(stage.description)")
                        Text("Water Requirement: \(stage.waterRequirement)")
                        Text("Sunlight Requirement: \(stage.sunlightRequirement.0) to \(stage.sunlightRequirement.1) hours")
                        Text("Soil Composition: \(stage.soilComposition)")
                        Text("Volume: \(stage.volume)L")
                        Text("Draining Requirement: \(stage.drainingRequirement ? "Yes" : "No")")
                        if let tempRange = stage.temperatureRange {
                            Text("Temperature Range: \(tempRange.0)°C to \(tempRange.1)°C")
                        }
                        Text("Root Depth: \(stage.rootDepth)cm")
                        Text("Spacing: \(stage.spacing)cm")
                        
                        // Usamos el índice para construir el nombre de la imagen
                        Image("tomatoStage\(index)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        
                        Text("Notes: \(stage.notes)")
                    }
                    .padding()
                    .background(Color.white) // Fondo de cada tarjeta, ajusta a tus necesidades
                    .cornerRadius(10) // Esquinas redondeadas para cada tarjeta
                    .shadow(radius: 5) // Sombra para dar efecto elevado a cada tarjeta
                }
            }
            .padding(.horizontal) // Espaciado horizontal para que no esté pegado a los bordes
        }
    }
}



struct TomatoStageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TomatoStageDetailView()
    }
}

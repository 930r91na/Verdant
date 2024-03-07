import UIKit
import SwiftUI
import RealityKit
import ARKit

struct PotViewPlant: UIViewRepresentable{
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARView()
        
        // Start AR session
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical]
        session.run(config)
        
        // Load the .reality file's scene asynchronously
        /*
        Pro.loadPotAsync { result in
            switch result {
            case .success(let anchor):
                // Add the loaded scene to the ARView
                arView.scene.anchors.append(anchor)
            case .failure(let error):
                // Handle errors here
                print("Error loading scene: \(error.localizedDescription)")
            }
        }
        */
        return arView
    }
}

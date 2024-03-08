import UIKit
import SwiftUI
import RealityKit
import ARKit
import AVFoundation

struct PotViewPlant: UIViewRepresentable{
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARView()
        //arView.debugOptions = [.showFeaturePoints, .showWorldOrigin]

        // Start AR session
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config, options: [.resetTracking, .removeExistingAnchors])
        session.run(config)
        // addcoaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        arView.addSubview(coachingOverlay)
        
        
        // Load the .reality file's scene asynchronously
        Pot.loadSceneAsync(completion: { (result) in
            do {
                let pot = try result.get()
                arView.scene.anchors.append(pot)
            }catch{
                print("The AR view could not be loaded")
            }
            
        })
        
        
        Pot.loadSceneAsync() { result in
            switch result {
            case .success(let anchor):
                // Add the loaded scene to the ARView
                arView.scene.anchors.append(anchor)
            case .failure(let error):
                // Handle errors here
                print("Error loading scene: \(error.localizedDescription)")
            }
        }
        return arView
    }
}




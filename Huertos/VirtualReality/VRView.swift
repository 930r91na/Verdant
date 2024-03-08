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
        
        // Start AR session
        let session = arView.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical]
        session.run(config)
        
        // Load the .reality file's scene asynchronously
        Pot.loadSceneAsync(completion: { (result) in
            do {
                let pot = try result.get()
                arView.scene.anchors.append(pot)
            }catch{
                print("The AR view could not be loaded")
            }
            
        })
        
        /*
        Pot.loadSceneAsync() { result in
            switch result {
            case .success(let anchor):
                // Add the loaded scene to the ARView
                arView.scene.anchors.append(anchor)
            case .failure(let error):
                // Handle errors here
                print("Error loading scene: \(error.localizedDescription)")
            }
        }*/
        
        return arView
    }
}

/*
struct PotViewPlant: UIViewRepresentable {
    @ObservedObject var cameraPermissionHandler: CameraPermissionHandler

    func makeUIView(context: Context) -> ARView { // Specify ARView explicitly
        let arView = ARView()
        if cameraPermissionHandler.hasCameraPermission {
            // Setup AR session only if permission is granted
            let session = arView.session
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.vertical]
            session.run(config)
            
            // Replace 'Pot.loadSceneAsync' with your actual RealityKit scene loading if 'Pot' is your custom class
            // For now, the structure implies you're loading a scene named 'Pot', but adjust as needed.
            // Ensure 'Pot' refers to an existing RealityKit entity and that you're correctly loading a .reality file.
            // This placeholder will error if 'Pot' isn't defined in your actual code with a 'loadSceneAsync' method.
            
            // Correct way to load your scene might differ, this is just a template based on your previous snippets.
            Pot.loadSceneAsync(completion: { (result) in
                do {
                    let pot = try result.get() // Assuming 'pot' is a correctly typed RealityKit anchor
                    arView.scene.anchors.append(pot)
                } catch {
                    print("The AR view could not be loaded: \(error)")
                }
            })
        } else {
            // Optionally handle the case where camera permission is not granted
        }
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // Here, you can update the ARView if needed, based on changes to your SwiftUI state.
        // Since ARView doesn't need frequent updates for static content, this might be left empty.
    }
}
*/

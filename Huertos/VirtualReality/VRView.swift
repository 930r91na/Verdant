import UIKit
import RealityKit
import ARKit

class YourARViewController: UIViewController {
    @IBOutlet var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //let anchor = try! Experience.loadBox()
        //arView.scene.anchors.append(anchor)
    }
}

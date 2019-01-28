//
//  ViewController.swift
//  ARDicee
//
//  Created by Anand Nigam on 28/01/19.
//  Copyright © 2019 Anand Nigam. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        // ChamferRadius :- Rounded Corner
        
        let sphere = SCNSphere(radius: 0.1)
        
        // To change the material of the cube
        let material = SCNMaterial()
   //     material.diffuse.contents = UIColor.red
    //    cube.materials = [material]
        
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        sphere.materials = [material]
        
        
        
        // Scene Nodes:- Points in 3-D space
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        // -ve z means away from us. -ve y means going down, -ve x means towards left.
        
        node.geometry = sphere
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
//        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
//
//        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }


}

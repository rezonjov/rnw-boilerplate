//
//  ViewController.swift
//  ARKitSwift
//
//  Created by Rezon Jovian on 6/17/21.
//

import UIKit
import SceneKit
import ARKit
import React

class ARKitTwoViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    var nativeEventCallback: RCTBubblingEventBlock?
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showBoundingBoxes]
        sceneView.autoenablesDefaultLighting = true
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        if #available(iOS 11.3, *) {
          configuration.planeDetection = [.horizontal,.vertical]
        } else {
          configuration.planeDetection = [.horizontal]
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchLocation = touches.first?.location(in: sceneView) {
            let hitTestResults = sceneView.hitTest(touchLocation, types: .featurePoint)
            if let hitResult = hitTestResults.first {
              nativeEventCallback!(["X":  hitResult.worldTransform.columns.3.x,  " Y: ": hitResult.worldTransform.columns.3.y, "Z: " : hitResult.worldTransform.columns.3.z])
            
            }
        }
    }
    
    func setNativeEventCallback(eventCallback: RCTBubblingEventBlock? ) { 
      self.nativeEventCallback = eventCallback;
    }
   
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

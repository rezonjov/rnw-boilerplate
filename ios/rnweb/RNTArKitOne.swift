//
//  RNTARKitOne.swift
//  rnweb
//
//  Created by Rezon Jovian on 6/17/21.
//
// ARKit integration to React Native using Native UI component

import Foundation
import UIKit
import SceneKit
import ARKit
import React

class RNTARKitOneView: UIView, ARSCNViewDelegate {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupAR()
  }
 
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupAR()
  }
  
  private func setupAR() {
    self.isUserInteractionEnabled = true
    
    let sceneView: ARSCNView = ARSCNView()
    let configuration = ARWorldTrackingConfiguration()
     
    sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showBoundingBoxes]
    configuration.planeDetection = .horizontal
    sceneView.session.run(configuration)
    sceneView.delegate = self
    sceneView.autoenablesDefaultLighting = true
    sceneView.showsStatistics = true
    
    self.addSubview(sceneView)
     
    sceneView.translatesAutoresizingMaskIntoConstraints = false
    sceneView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    sceneView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    sceneView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    sceneView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

 }
}

@objc (RNTARKitOneViewManager)
class RNTARKitOneViewManager: RCTViewManager {
 
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
 
  override func view() -> UIView! {
    return RNTARKitOneView()
  }
}

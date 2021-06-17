//
//  CustomView.swift
//  rnplay
//
//  Created by Rezon Jovian on 6/15/21.
//

import Foundation
import UIKit
import SceneKit
import ARKit
import React
 

@objc (RNTARKitTwoView)
class RNTARKitTwoView: UIView, ARSCNViewDelegate {
  
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    setupAR()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    setupAR()
//  }
//
//  private func setupAR() {
//    self.isUserInteractionEnabled = true
//
//    let sceneView: ARSCNView = ARSCNView()
//    let configuration = ARWorldTrackingConfiguration()
//
//    sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showBoundingBoxes]
//    configuration.planeDetection = .horizontal
//    sceneView.session.run(configuration)
//    sceneView.delegate = self
//    sceneView.autoenablesDefaultLighting = true
//    sceneView.showsStatistics = true
//
//    self.addSubview(sceneView)
//
//    sceneView.translatesAutoresizingMaskIntoConstraints = false
//    sceneView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//    sceneView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//    sceneView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//    sceneView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//
// }
  
  
    weak var ARKitTwoVC: ARKitTwoViewController?
 
      
    override init(frame: CGRect) {
         super.init(frame: frame)
     }
    required init?(coder aDecoder: NSCoder) { fatalError("nope") }

    override func layoutSubviews() {
        super.layoutSubviews()

        if ARKitTwoVC == nil {
            embed()
        } else {
        ARKitTwoVC?.view.frame = bounds
        }
    }

    private func embed() {
        guard
            let parentVC = parentViewController  else {
            return
        }
 
//        let vc = ARKitTwoViewController()
        let storyboard = UIStoryboard(name: "ARKitTwo", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
    
        parentVC.addChild(vc)
        addSubview(vc.view)
        vc.view.frame = bounds
        vc.didMove(toParent: parentVC)
        self.ARKitTwoVC = vc as? ARKitTwoViewController
     }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

@objc (RNTARKitTwoViewManager)
class RNTARKitTwoViewManager: RCTViewManager {
 
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
   
   override func view() -> UIView! {
     return RNTARKitTwoView()
   }

//
//  override func view() -> UIView! {
//    let storyboard = UIStoryboard(name: "ARKitTwo", bundle: nil)
//    let vc = storyboard.instantiateInitialViewController()!
//    NSLog(vc.view.debugDescription);
//
//    NSLog("TEST");
//    vc.loadView();
//    return vc.view;
//  }

}
